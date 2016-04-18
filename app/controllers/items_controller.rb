class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_event
  before_action :load_item, only: [:show, :edit, :destroy]


  def index
    @items = Item.where(event_id: params[:event_id])
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.user = current_user
    if item.save
      redirect_to event_path(item.event)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @item.assign_attributes(item_params)
    if @item.save
      redirect_to event_items_path(@item.event)
    else
      flash[:error] = "Unable to update Item!  Please try again."
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to event_items_path(@event)
  end

  private

  def item_params
    params.require(:item).permit(:name, :quantity, :description, :event_id)
  end

  def load_event
    @event = Item.find(params[:event_id])
  end

  def load_item
    @item = Item.find(params[:id])
  end
end
