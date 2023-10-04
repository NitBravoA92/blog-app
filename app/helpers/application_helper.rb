module ApplicationHelper
  def navigation_path
    content = ''
    unless controller_name == 'users' && action_name == 'index'
      content << "<li>#{link_to 'All Users',
                                get_url(1)}</li>"
    end

    content << generate_nav_link({ name: 'posts', action: 'index' }, 'User bio', 2)
    content << generate_nav_link({ name: 'posts', action: 'new' }, 'User posts', 3)
    content << generate_nav_link({ name: 'posts', action: 'show' }, 'User posts', 3)
    content << generate_nav_link({ name: 'comments', action: 'new' }, 'Back to post', 4)

    content << generate_session_nav_link

    content.html_safe
  end

  def generate_nav_link(req_data, title, level)
    return '' unless controller_name == req_data[:name] && action_name == req_data[:action]

    "<li>#{link_to title, get_url(level)}</li>"
  end

  def generate_session_nav_link
    sign_out = "<li class='session_nav_link'>#{link_to 'Sign Out', destroy_user_session_path,
                                                       data: { turbo_method: :delete }}</li>"
    sign_in = "<li class='session_nav_link'>#{link_to 'Sign In', new_user_session_path}</li>"
    sign_up = "<li class='session_nav_link'>#{link_to 'Sign Up', new_user_registration_path}</li>"

    user_signed_in? ? sign_out : sign_in + sign_up
  end

  def get_url(level)
    case level
    when 1 then users_path
    when 2 then user_path(@user)
    when 3 then user_posts_path
    when 4 then user_post_path(@user, @post)
    end
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
