class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @pending_requests = @user.inverse_friendships.where(confirmed: false)
    @friends = @user.friendships.where(confirmed: true)
    @posts = @user.posts.ordered_by_most_recent
  end

  def send_request
    Friendship.create(user_id: current_user.id, friend_id: params[:id], confirmed: false)
    redirect_to request.referrer, notice: 'Friend request sent successfully!'
  end

  def accept_request
    @friend = Friendship.find(params[:id])
    @friend.update(confirmed: true)
    @friend2 = Friendship.create(user_id: current_user.id, friend_id: @friend.user_id, confirmed: true)
    redirect_to request.referrer, notice: 'Friend request accepted'
  end

  def decline_request
    @friend = Friendship.find(params[:id])
    @friend2 = Friendship.where(user_id: @friend.friend_id, friend_id: @friend.user_id, confirmed: true).first
    @friend.destroy
    @friend2&.destroy
    redirect_to request.referrer, notice: 'Friend request declined'
  end
end
