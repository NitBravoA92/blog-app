module PostsHelper
  def trim_post_content(text)
    size = 100
    text.length <= size ? text : "#{text[0..size]}..."
  end
end
