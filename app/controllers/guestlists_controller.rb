class GuestlistsController < ApplicationController
  def index
    event = Event.find(params[:event_id])
    @guestlist = event.guestlist
  end

  def invite_list
    event = Event.find(params[:event_id])
    @guestlist = event.guestlist
  end

  def invite
    @user = User.new()
  end
end
