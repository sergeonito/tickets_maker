# frozen_string_literal: true

class Ticket < ApplicationRecord
  include StringUtils

  # Structure
  enum department: %i[it support sales other]

  # Hooks
  before_create :set_ticket_id

  private

  def set_ticket_id
    self.tid = generate_ticket_id
  end
end
