module ApplicationHelper

  def gravatar_for(user, options = { size:80 })
    gravatar_id = Digest::MD5::hexdigest(current_user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, class: "gravatar")
  end
end
