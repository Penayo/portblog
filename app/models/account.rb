class Account < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Invalid email" }

  has_secure_password
  has_one_attached :profile_img
  has_many :articles

  def full_name
    name
  end
end
