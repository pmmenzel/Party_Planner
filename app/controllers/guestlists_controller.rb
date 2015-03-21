class GuestlistsController < ApplicationController
  def invite_list
    event = Event.find(params[:event_id])
    @guestlist = event.guestlist
  end

  def invite

  end
end
