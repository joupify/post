class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user

  validates :user, presence: true

  MIN_BODY_LENGTH = 2
  MAX_BODY_LENGTH = 1000

  validates :content, presence: true
  validates :content, length: { minimum: MIN_BODY_LENGTH, maximum: MAX_BODY_LENGTH }
  
end
