class Employee < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }
  validates :phone_number, presence: true, length: { minimum: 10 }
end
