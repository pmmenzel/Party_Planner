class EventsController < ApplicationController
  include EventHelper
  before_filter :authenticate_user!, except: [:show]
  before_filter :allowed_guest?, only: [:show]


  def index
    @events = Event.where(user_id: current_user.id)
    @user = current_user
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params.merge(create_params))
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def show
    @event =  Event.find(params[:id])
    # TODO: What the fuck am I doing here.  params[:id] is for event, not item.  Dummy
    @items = Item.where(event_id: params[:id])
    # user_valid_show(@event)   ##purposely kept in. Other method to prevent users from going to any restful route if can can doesn't work.
  end

  def edit
    @event =  Event.find(params[:id])
  end

  def update
    @event =  Event.find(params[:id])
    @event.update_attributes(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    @event =  Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end


  private

  def event_params
    params.require(:event).permit(:name, :date, :location, :public_party, :user_id)
  end

  def party_date
    params[:event].delete('date')
  end

  def create_params
    token = SecureRandom.hex
    user_id = current_user.id
    { token: token, user_id: user_id }
  end

  def allowed_guest?
    # grab all event users emails
    # check if the auth_token parameter matches any users emails + event_token after being Base64.encode64.
    # if so, return true, else return false and redirect with flash message.
    # emails = event.users.pluck(:email)
    # emails.any? {|email| params[:auth_token] == Base64.encode64(email+event.token) }
  end

end
