class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :update_counter

  validates_associated :post, :author
  validates :text, presence: true

  private

  def update_counter
    post.increment!(:comments_counter)
  end
end
