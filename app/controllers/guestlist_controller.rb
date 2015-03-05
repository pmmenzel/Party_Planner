class GuestlistController < ApplicationController

  def show_guestlist
    @guestlist = Guestlist.find_by_event_id(params[:event_id])
  end

end
