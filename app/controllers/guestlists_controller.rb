class GuestlistsController < ApplicationController
  def invite_list
    # p "hello"
    event = Event.find(params[:event_id])
    # @user = User.find(params[:user_id])
    @guestlist = event.guestlist
  end

  def invite

  end
end
