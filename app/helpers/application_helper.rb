module ApplicationHelper
  def navigation_path
    content = ''
    unless controller_name == 'users' && action_name == 'index'
      content << "<li>#{link_to 'All Users',
                                users_path}</li>"
    end
    content << generate_nav_link({ name: 'posts', action: 'index' }, 'User bio', user_path(@user))
    content << generate_nav_link({ name: 'posts', action: 'new' }, 'User posts', user_posts_path)
    content << generate_nav_link({ name: 'posts', action: 'show' }, 'User posts', user_posts_path)
    content << generate_nav_link({ name: 'comments', action: 'new' }, 'Back to post', user_post_path(@user, @post))
    content.html_safe
  end

  def generate_nav_link(req_data, link_title, link_url)
    return '' unless controller_name == req_data[:name] && action_name == req_data[:action]

    "<li>#{link_to link_title, link_url}</li>"
  end

  def flash_alert
    content = ''
    flash.each do |key, value|
      content << "
      <div class='flash flash_alert-#{key}'>
        <p class='flash_alert_content'>#{value}</p>
      </div>
    "
    end
    content.html_safe
  end
end
