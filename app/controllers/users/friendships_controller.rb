class Users::FriendshipsController < ApplicationController
  def create
    # require 'pry'; binding.pry
    friend = User.find_by(email: params[:email])
    Friendship.create!(user: current_user, friend: friend)

  #   if params[:status] == 'accepted'
  #     invitee = User.find(params[:user])
  #     Friendship.create(user: current_user, friend: invitee, status: :accepted)
  #     friendship = Friendship.find_by(user: invitee, friend: current_user)
  #     friendship.update(status: :accepted)
  #   else
  #     Friendship.create(user: current_user, friend: params[:friend])
  #   end
    redirect_to user_dashboard_path(current_user)
  end

  def update
    invite = Friendship.find(params[:friendship_id])
    invite.update(friendship_params)
    redirect_to user_dashboard_path(current_user)
  end

  private

  def friendship_params
    params.permit(:status)
  end
end