class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  before_destroy :decrement_user_comments_counter
  after_save :update_counter
  validates :text, presence: true

  private

  def update_counter
    post.increment!(:comments_counter)
  end

  def decrement_user_comments_counter
    post.decrement!(:comments_counter)
  end
end
