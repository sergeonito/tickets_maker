# frozen_string_literal: true

# Create admin accounts
User.create([{ email: 'admin01@ticketpro.com', password: 'foobar12345' },
             { email: 'admin02@ticketpro.com', password: 'foobar12345' }])
