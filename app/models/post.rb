class Post < ApplicationRecord
  # association with other models: User, Comment and Like
  belongs_to :author, class_name: "User", foreign_key: "author_id_id"
  has_many :comments, class_name: "Comment", foreign_key: "posts_id"
  has_many :likes, class_name: "Like", foreign_key: "posts_id"

  # custom query: the five most recent comments for a given post
  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  # update the posts counter of a User
  after_save :update_posts_counter_by_user
  after_destroy :update_posts_counter_by_user

  def update_posts_counter_by_user
    author.update(posts_counter: author.posts.count)
  end
end
