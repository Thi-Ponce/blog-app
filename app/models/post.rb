class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def most_recent
    comments.order(created_at: :desc).limit(5)
  end

  def short_text
    text.truncate(75)
  end

  def liked?(user)
    likes.where(author_id: user.id).any?
  end

  after_save :update_counter

  validates_associated :author
  validates :title, length: { in: 1..250, message: 'the title should not exceed 250 char' }
  validates :text, presence: true
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }

  private

  def update_counter
    author.increment!(:posts_counter)
  end
end
