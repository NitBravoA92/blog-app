class User < ApplicationRecord
  # association with other models: Post, Comment and Like
  has_many :posts, class_name: "Post", foreign_key: "author_id_id"
  has_many :comments, class_name: "Comment", foreign_key: "users_id"
  has_many :likes, class_name: "Like", foreign_key: "users_id"
  
  # custom query: the three most recent posts for a given user.
  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
