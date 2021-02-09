class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: :email

  has_many :friendships, dependent: :destroy
  has_many :guests, dependent: :destroy
  has_many :parties, dependent: :destroy

  def friend_invites
    Friendship.where(friend: self, status: :pending)
  end

  def friends
    Friendship.friends(self.id)
  end
end
