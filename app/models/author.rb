class Author < ApplicationRecord
  has_one_attached :profile_image
  has_many :articles

  def full_name
    "#{first_name} #{last_name}"
  end
end
