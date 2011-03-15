module ApplicationHelper

  def javascript(*args)
    javascript_include_tag *args
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
end
