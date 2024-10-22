class Article < ApplicationRecord
  include Visible

  belongs_to :author, class_name: 'Account'
  has_many :comments, dependent: :destroy

  has_one_attached :main_img

  validates :title, presence: true
  validates :body,  presence: true, length: { minimum: 10 }
end
