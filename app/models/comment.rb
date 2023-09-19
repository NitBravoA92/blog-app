class Comment < ApplicationRecord
  # association with other models: User and Post
  belongs_to :author, class_name: "User", foreign_key: "users_id"
  belongs_to :post, class_name: "Post", foreign_key: "posts_id"

  # update the comments counter of a Post
  after_save :update_comments_counter_by_post
  after_destroy :update_comments_counter_by_post

  def update_comments_counter_by_post
    post.update(comments_counter: post.comments.count)
  end
end
