module ApplicationHelper
  def navigation_path
    content = ''
    if controller_name == 'users' && action_name == 'show'
      content << "<li>#{link_to 'All Users', users_path }</li>"
    end
    if controller_name == 'posts' && action_name == 'index'
      content << "<li>#{link_to 'User details', user_path(@user) }</li>"
    end
    if controller_name == 'posts' && action_name == 'show'
      content << "<li>#{link_to 'User posts', user_posts_path }</li>"
    end
    content.html_safe
  end

  def flash_alert
    content = ''
    flash.each do |key, value|
      content << "
      <div class='flash_alert-#{key}'>
        <p class='flash_alert_content'>#{value}</p>
      </div>
    "
    end
    content.html_safe
  end
end
