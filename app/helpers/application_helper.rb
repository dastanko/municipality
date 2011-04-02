module ApplicationHelper
  def title(page_title, show_title = true)
    content_for(:title) { page_title.to_s }
  end

  def show_title?
    @show_title
  end

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
    map = "http://maps.google.com/maps/api/js?sensor=false&language=ru"
    if request.url == root_url
      javascript_include_tag map, "markerclusterer", "init"
    elsif request.url == new_report_url
      javascript_include_tag map, "gmap", "epoly3"
    end
  end

  def preload_map
    if request.url == root_url
      render "shared/map"
    elsif request.url == new_report_url
      render "shared/map"
    end
  end

  def avatar_url(user)
    default_url = "#{root_url}images/avatar.png"
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
  end
end
