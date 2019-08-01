class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }
  validates :phone_number, presence: true, length: { minimum: 10 }


  def self.to_csv
    attributes = %w{name email phone_number}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.order(:name).first(50).each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end
end
