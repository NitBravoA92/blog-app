class Like < ApplicationRecord
  # association with other models: User and Post
  belongs_to :author, class_name: "User", foreign_key: "users_id"
  belongs_to :post, class_name: "Post", foreign_key: "posts_id"

  # update the likes counter of a Post
  after_save :update_likes_counter_by_post
  after_destroy :update_likes_counter_by_post

  def update_likes_counter_by_post
    post.update(likes_counter: post.likes.count)
  end
end
