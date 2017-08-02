# frozen_string_literal: true

class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :tid
      t.string :name
      t.string :email
      t.integer :department
      t.string :subject
      t.string :body
      t.string :resolution

      t.timestamps
    end
  end
end
