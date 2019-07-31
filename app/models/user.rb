class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }
  validates :mobile_no, presence: true


  def self.to_csv
    attributes = %w{name email mobile_no}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.order(:name).first(50).each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end
end
