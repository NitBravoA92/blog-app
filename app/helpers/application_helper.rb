module ApplicationHelper
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
