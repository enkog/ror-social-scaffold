class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_users, only: %i[show send_request accept_request decline_request]

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

  def accept_request
    if @user.requested_friends.include?(@friend)
      Friendship.accept(@user, @friend)
      flash[:notice] = "Friendship with #{@friend.name} accepted!"
    else
      flash[:notice] = "No friendship request from #{@friend.name}."
    end
    redirect_to request.referrer
  end

  def decline_request
    if @user.requested_friends.include?(@friend)
      Friendship.breakup(@user, @friend)
      flash[:notice] = "Friendship with #{@friend.name} declined"
    else
      flash[:notice] = "No friendship request from #{@friend.name}."
    end
    redirect_to request.referrer
  end

  private

  def setup_users
    @user = User.find(params[:id])
    @friend = User.find_by_name(params[:id])
  end
end
