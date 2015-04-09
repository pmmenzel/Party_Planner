class ItemsController < ApplicationController

  def index
    @items = Item.where(event_id: params[:event_id])
    @event = Event.find(params[:event_id])
  end

  def new
    @item = Item.new
  end

  def create
    user = current_user
    @item = Item.new(item_params.merge(event_id: params[:event_id]))
    @item.user = user
    if @item.save
      redirect_to user_event_path(@item.event.user, @item.event)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update_attributes(item_params)
    if item.save
      redirect_to user_event_items_path(item.event.user, item.event)
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id]).destroy
    event = Event.find(params[:event_id])
    redirect_to user_event_items_path(event.user, event)
  end

  private

  def item_params
    params.require(:item).permit(:name, :quantity, :description, :event_id)
  end
end
