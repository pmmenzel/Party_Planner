class EventsController < ApplicationController

  def index
    @events = Event.where(user_id: current_user.id)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params.merge(user_id: current_user.id))
    if @event.save
      guestlist = Guestlist.create(event_id: @event.id)
      @event.guestlist_id = guestlist.id
      @event.save
      p @event
      redirect_to user_event_path(@event.user, @event)
    else
      render :new
    end
  end

  def show
    @event =  Event.find(params[:id])
  end

  def edit
    @event =  Event.find(params[:id])
  end

  def destroy
    @event =  Event.find(params[:id])
    user =  params[:user_id]
    if @event.guestlist_id
    guestlist = Guestlist.find(@event.guestlist_id)
    guestlist.destroy
    end
    @event.destroy
    redirect_to user_events_path(user)
  end


  private

  def event_params
    params.require(:event).permit(:name, :date, :location, :public_party, :user_id, :guestlist_id)
  end

end
