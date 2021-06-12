module UsersHelper
  def follow(user)
    return if current_user.request_connections.include?(current_user)

    link_to(image_tag('plus-circle.svg', width: '35'), follow_path(user_id: user.id), class: '', method: :post)
  end
end