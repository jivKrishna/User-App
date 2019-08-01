class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search(search)
    if search
      where(["LOWER(name) LIKE ? OR LOWER(email) LIKE ?","%#{search}%", "%#{search}%"])
    else
      all
    end
  end
end
