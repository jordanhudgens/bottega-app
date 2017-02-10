module ApplicationHelper
  def gravatar_helper user
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?d=monsterid", width: 60
  end
end
