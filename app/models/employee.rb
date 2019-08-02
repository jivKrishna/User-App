class Employee < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }
  validates :phone_number, presence: true, length: { minimum: 10 }
  validates_format_of :phone_number, with: /\A(\d{10}|\(?\d{3}\)?[-.\s]\d{3}[-.\s]\d{4})\z/, message: "Only positive number without spaces are allowed"
end
