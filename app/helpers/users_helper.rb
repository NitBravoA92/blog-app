module UsersHelper
  # create 'see all posts' button only when user has posts created
  def show_see_all_posts_button(user)
    content = ''
    starting = "<div class='container'>
    <div class='button_container'>"
    ending = '</div></div>'

    content << if user.posts_counter.positive?
                 "#{starting}
        #{link_to 'See all posts', user_posts_url(user), class: 'btn'}
      #{ending}"
               else
                 "
      #{starting}
        #{render partial: 'partials/add_post_button', object: user, as: :user}
      #{ending}"
               end
    content.html_safe
  end
end
