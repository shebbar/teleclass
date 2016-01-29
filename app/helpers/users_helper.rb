module UsersHelper

	# Returns the Gravatar for the given user.
  def avatar_for(user)
    image_tag("user.png", alt: user.name, class: "avatar")
  end
end
