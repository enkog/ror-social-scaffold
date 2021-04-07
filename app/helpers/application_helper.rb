module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  def friends(user)
    unless Friendship.where(user_id: current_user.id, friend_id: user.id, confirmed: true).exists? && Friendship.where(user_id: user.id, friend_id: current_user.id, confirmed: true).exists?
      return false
    end

    true
  end

  def pending_req(user)
    unless Friendship.where(user_id: current_user.id, friend_id: user.id, confirmed: false).exists? || Friendship.where(user_id: user.id, friend_id: current_user.id, confirmed: false).exists?
      return false
    end

    @pending_request = current_user.inverse_friendships.where(confirmed: false, user_id: user.id).first
    true
  end

  def accept_req(friend)
    link_to('Accept', accept_request_user_path(id: friend.id), method: :patch)
  end

  def reject_req(friend)
    link_to('Decline', decline_request_user_path(id: friend.id), method: :delete)
  end

  def decline_req(user)
    user1 = Friendship.where(user_id: current_user.id, friend_id: user.id, confirmed: true)
    user2 = Friendship.where(user_id: user.id, friend_id: current_user.id, confirmed: true)
    friendship = user1.exists? ? user1 : user2
    link_to('Unfriend', decline_request_user_path(id: friendship.ids), method: :delete)
  end
end
