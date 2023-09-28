module PostsHelper
  def trim_post_content(text)
    size = 100
    text.length <= size ? text : "#{text[0..size]}..."
  end

  def show_likes_button
    if @is_liked
      button_to "Don't Like it", deletelike_user_post_path(@post.author, @post), method: :delete, class: 'btn', remote: true
    else
      button_to 'Like it', addlike_user_post_path(@post.author, @post), method: :post, class: 'btn', remote: true
    end 
  end
end
