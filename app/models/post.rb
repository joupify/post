class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, as: :commentable, dependent: :destroy

    validates :title, presence: true
    validates :description, presence: true
    validates :user_id, presence: true

end
