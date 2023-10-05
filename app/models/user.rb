class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # association with other models: Post, Comment and Like
  has_many :posts, class_name: 'Post', foreign_key: 'author_id_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'users_id'
  has_many :likes, class_name: 'Like', foreign_key: 'users_id'

  # attributes validations
  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  # custom query: the three most recent posts for a given user.
  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  after_initialize :set_default_user_role, if: :new_record?

  def set_default_user_role
    self.role ||= "admin"
  end
end
