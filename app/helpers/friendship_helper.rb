module FriendshipHelper
  def friendship_status(user, friend)
    friendship = Friendship.find_by_user_id_and_friend_id(user, friend)
    flash[:notice] = if friendship.nil?
                       "#{friend.name} is not your friend (yet)."
                     else
                       "#{friend.name} is your friend."
                     end
  end

  def cancel
    if @user.pending_friends.include?(@friend)
      Friendship.breakup(@user, @friend)
      flash[:notice] = 'Friendship request canceled.'
    else
      flash[:notice] = "No request for friendship with #{@friend.name}"
    end
    redirect_to request.referrer
  end

  def destroy_friend
    if @user.friends.include?(@friend)
      Friendship.breakup(@user, @friend)
      flash[:notice] = "Friendship with #{@friend.name} deleted!"
    else
      flash[:notice] = "You aren't friends with #{@friend.name}"
    end
    redirect_to request.referrer
  end
end
