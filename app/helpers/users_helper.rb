module UsersHelper
  def follow(user)
    return if current_user == user

    if current_user.following.include?(user)
      link_to('Unfollow', unfollow_path(user_id: user.id),
              method: :delete,
              style: 'text-decoration: none; font-size: 11px',
              class: 'bg-twitter p-1 px-2 text-white')
    else
      link_to('Follow', follow_path(user_id: user.id), method: :post,
                                                       style: 'text-decoration: none; font-size: 11px',
                                                       class: 'bg-twitter p-1 px-2 text-white')
    end
  end
end
