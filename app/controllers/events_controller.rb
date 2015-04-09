class EventsController < ApplicationController
  include EventHelper
  before_filter :authenticate_user!

  def index
    @events = Event.where(user_id: current_user.id)
    @user = current_user
    # user_valid_index   ##purposely kept in. Other method to prevent users from going to any restful route if can can doesn't work.
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
      redirect_to user_event_path(@event.user, @event)
    else
      render :new
    end
  end

  def show
    @event =  Event.find(params[:id])
    @guestlist = Guestlist.find_by_event_id(@event.id)
    @items = Item.where(event_id: params[:id])
    # user_valid_show(@event)   ##purposely kept in. Other method to prevent users from going to any restful route if can can doesn't work.
  end

  def edit
    @event =  Event.find(params[:id])
  end

  def update
    @event =  Event.find(params[:id])
    user = params[:id]
    @event.update_attributes(event_params)
    redirect_to user_event_path(user,@event)
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
