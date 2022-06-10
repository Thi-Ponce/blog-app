class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :update_counter

  def liked?(user)
    likes.where(user_id: user.id).any?
  end

  private

  def update_counter
    post.increment!(:likes_counter)
  end
end
