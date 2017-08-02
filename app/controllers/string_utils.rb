# frozen_string_literal: true

module StringUtils
  # Generate uniq ticket id in format: ABC-123-ABC-123-ABC
  # Where: ABC is random 3-char string, 123–random 3-digit number
  def generate_ticket_id
    "#{uniq_letters(3)}-#{uniq_numbers(3)}-#{uniq_letters(3)}-#{uniq_numbers(3)}-#{uniq_letters(3)}"
  end

  private

  def uniq_letters(count = 1)
    (1..count).map { ('A'..'Z').to_a.sample }.join
  end

  def uniq_numbers(count = 1)
    (1..count).map { (0..9).to_a.sample }.join
  end
end
