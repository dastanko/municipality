module ApplicationHelper
  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def error_messages_for(object)
    render 'shared/error_messages', :target => object
  end

  def load_map
    if request.url == root_url
      javascript_include_tag "http://maps.google.com/maps/api/js?sensor=false&language=ru", "init"
    elsif request.url == new_report_url
      javascript_include_tag "http://maps.google.com/maps/api/js?sensor=false&language=ru", "gmap", "epoly3"
    end
  end

end
