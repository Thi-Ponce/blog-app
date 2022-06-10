class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy

  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }

  def most_recent
    posts.order(created_at: :desc).limit(3)
  end
end
