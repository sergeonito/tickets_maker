# frozen_string_literal: true

class TicketMailer < ApplicationMailer
  # Send ticket added details
  def send_ticket_status(ticket, status = 'created')
    @ticket = ticket
    @status = status
    mail(to: ticket.email,
         subject: "[TicketPro] Your ticket with id: #{@ticket.tid} is #{@status}.")
  end
end
