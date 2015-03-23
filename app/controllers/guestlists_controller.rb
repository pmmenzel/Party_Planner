class GuestlistsController < ApplicationController
  def index
    event = Event.find(params[:event_id])
    @guestlist = event.guestlist
  end

  def new_guest
    event = Event.find(params[:event_id])
    @guestlist = event.guestlist
  end

  def create_guest
    @user = User.new()
  end
end
