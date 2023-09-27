module UsersHelper
  # create 'see all posts' button only when user has posts created
  def show_see_all_posts_button(user)
    content = ''
    if user.posts_counter > 0
      content << "
      <div class='container'>
        <div class='button_container'>
          #{link_to 'See all posts', user_posts_url(user), class: 'btn'}
        </div>
      </div>
      "
    end
    content.html_safe
  end
end
