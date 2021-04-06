class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_friends, only: %i[show create_friendship accept decline]

  def index
    @users = User.all
  end

  def show
    @posts = @user.posts.ordered_by_most_recent
  end

  def send_request
    current_user.friendships.create(user_id: current_user.id, friend_id: @user.id, confirmed: false)
    redirect_to request.referrer, notice: 'Friend request sent'
  end

  def update_friend
    if @user.requested_friends.include?(@friend)
      Friendship.accept(@user, @friend)
      flash[:notice] = "Friendship with #{@friend.name} accepted!"
    else
      flash[:notice] = "No friendship request from #{@friend.name}."
    end
    redirect_to request.referrer
  end

  def decline
    if @user.requested_friends.include?(@friend)
      Friendship.breakup(@user, @friend)
      flash[:notice] = "Friendship with #{@friend.name} declined"
    else
      flash[:notice] = "No friendship request from #{@friend.name}."
    end
    redirect_to request.referrer
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

  private

  def setup_friends
    @user = User.find(session[:user_id])
    @friend = User.find_by_name(params[:id])
  end
end
