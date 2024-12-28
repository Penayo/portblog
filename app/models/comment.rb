class Comment < ApplicationRecord
  include Visible

  belongs_to :article
  belongs_to :response, class_name: "Comment", optional: true
  has_many :responses, class_name: "Comment", foreign_key: :response_id, dependent: :destroy

  scope :direct_comments, -> { where('response_id is null').order('created_at DESC') }
end
