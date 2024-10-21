class Author < ApplicationRecord
  has_one_attached :profile_image
  has_many :articles
  belongs_to :user

  def full_name
    "#{first_name} #{last_name}"
  end
end
