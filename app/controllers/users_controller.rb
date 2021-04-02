class UsersController < ApplicationController
  before_action :authenticate_user!, :setup_friends

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  def accept
    if @user.requested_friends.include?(@friend)
      Friendship.accept(@user, @friend)
      flash[:notice] = "Friendship with #{@friend.name} accepted!"
    else
      flash[:notice] = "No friendship request from #{@friend.name}."
    end
      redirect_to root_path
  end
        
  def decline
    if @user.requested_friends.include?(@friend)
      Friendship.breakup(@user, @friend)      
      flash[:notice] = "Friendship with #{@friend.name} declined"
    else
      flash[:notice] = "No friendship request from #{@friend.name}."        
    end
      redirect_to root_path      
  end
        
  def cancel       
    if @user.pending_friends.include?(@friend)
      Friendship.breakup(@user, @friend)
      flash[:notice] = "Friendship request canceled."
    else
      flash[:notice] = "No request for friendship with #{@friend.name}"
    end
      redirect_to root_path
  end

  def delete
    if @user.friends.include?(@friend)
      Friendship.breakup(@user, @friend)
      flash[:notice] = "Friendship with #{@friend.name} deleted!"
    else
      flash[:notice] = "You aren't friends with #{@friend.name}"
    end
      redirect_to root_path
  end

  private
  def setup_friends
    @user = User.find(session[:user_id])
    @friend = User.find_by_name(params[:id])
  end
end
