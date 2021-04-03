module FriendshipHelper
  def friendship_status(user, friend)
    friendship = Friendship.find_by_user_id_and_friend_id(user, friend)
    flash[:notice] = if friendship.nil?
                       "#{friend.name} is not your friend (yet)."
                     else
                       "#{friend.name} is your friend."
                     end
  end
end
