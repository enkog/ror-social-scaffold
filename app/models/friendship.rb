class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'

  # Pending friend request
  def self.request(user, friend)
    transaction do
      return create(user: user, friend: friend, confirmed: 'false') if user == friend or Friendship.exists?(user,
                                                                                                            friend)
    end
  end

  # Accepted friend request.
  def self.accept(user, friend)
    transaction do
      accepted_at = Time.now
      accept_request(user, friend, accepted_at)
      accept_request(friend, user, accepted_at)
    end
  end

  # Delete friendship
  def self.breakup(user, friend)
    transaction do
      destroy(find_by_user_id_and_friend_id(user, friend))
      destroy(find_by_user_id_and_friend_id(friend, user))
    end
  end

  def self.accept_request(user, friend, accepted_at)
    request = find_by_user_id_and_friend_id(user, friend)
    request.confirmed = 'true'
    request.accepted_at = accepted_at

    request.save!
  end
end
