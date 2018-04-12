module ApplicationHelper

  def auth_token
  # 1 wrap it around html_safe or it will literally print out
  # 2 we need to interplate the actual form_authenticity_token using erb tags
  #  form_authenticity_token using the string interpolation syntax we know and love (#{}).
  "<input type='hidden' name='authenticity_token' value='<%= #{form_authenticity_token} %>'/>".html_safe

  end

  # go and into html and make changes
  # <%= auth_token %>,
end
