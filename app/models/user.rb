class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  enum role: %i[user admin]
  after_initialize :set_default_role, if: :new_record?
  after_save :user_token
  def set_default_role
    self.role ||= :user
  end
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }

  def most_recent
    posts.order(created_at: :desc).limit(3)
  end

  def user_token
    update_column(:token, TokenAuthorization::TokenClass.encode(email))
  end
end
