module PostsHelper
  def trim_post_content(text)
    size = 100
    text.length <= size ? text : "#{text[0..size]}..."
  end

  def show_likes_button
    if @is_liked
      button_to "Don't Like it", deletelike_user_post_path(@post.author, @post), method: :delete, class: 'btn',
                                                                                 remote: true
    else
      button_to 'Like it', addlike_user_post_path(@post.author, @post), method: :post, class: 'btn', remote: true
    end
  end

  def show_create_post_button
    content = ''

    return '' unless user_signed_in?

    content << link_to('Create a post', new_user_post_path(@user), class: 'btn').to_s

    content.html_safe
  end

  def show_delete_post_button
    content = ''

    return '' unless can?(:delete, @post)

    content << button_to('Delete this post', user_post_path(current_user, @post), method: :delete, class: 'btn',
                                                                                  remote: true).to_s

    content.html_safe
  end
end
