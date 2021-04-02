class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User',  foreign_key: 'friend_id'

  validates :user_id, presence: true
  validates :friend_id, presence: true

# Pending friend request
def self.request(user, friend)
  unless user == friend or Friendship.exists?(user, friend)
  transaction do
    create(user: user, friend: friend, confirmed: 'false')
  end
end

# Accept a friend request.
def self.accept(user, friend)
  transaction do
    accepted_at = Time.now
    accept_request(user, friend, accepted_at)
    accept_request(friend, user, accepted_at)
  end
end

# Delete a friendship
def self.breakup(user, friend)
  transaction do
  destroy(find_by_user_id_and_friend_id(user, friend))
  destroy(find_by_user_id_and_friend_id(friend, user))
  end
end

private
def self.accept_request(user, friend, accepted_at)
  request = find_by_user_id_and_friend_id(user, friend)
  request.confirmed = 'true'
  request.accepted_at = accepted_at
  
  request.save!
  end
end
