# frozen_string_literal: true

class TicketsController < ApplicationController
  PARAMS_CREATE = %i[name email department subject body].freeze
  PARAMS_UPDATE = PARAMS_CREATE + [:resolution]

  before_action :set_ticket, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[index edit update destroy]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show; end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit; end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params_create)

    respond_to do |format|
      if @ticket.save
        TicketMailer.send_ticket_status(@ticket).deliver_later
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params_update)
        TicketMailer.send_ticket_status(@ticket, 'updated').deliver_later
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ticket_params_create
    params.require(:ticket).permit(*PARAMS_CREATE)
  end

  def ticket_params_update
    params.require(:ticket).permit(*PARAMS_UPDATE)
  end
end
