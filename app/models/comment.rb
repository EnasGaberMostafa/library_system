class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :body, :user_id, :book_id, presence: true
end
