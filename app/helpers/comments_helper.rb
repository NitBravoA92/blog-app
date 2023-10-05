module CommentsHelper
  def show_delete_comment_button(comment)
    content = ''

    return '' unless can?(:destroy, comment)

    content << button_to('Delete this comment', user_post_comment_path(comment.post.author, comment.post, comment),
                         method: :delete, class: 'btn', remote: true).to_s

    content.html_safe
  end
end
