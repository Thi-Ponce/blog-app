class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :update_counter

  private

  def update_counter
    author.increment!(:comments_counter)
  end
end
