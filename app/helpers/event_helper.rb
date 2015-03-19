module EventHelper
  def user_valid_index
    if current_user.id != params[:user_id].to_i
      redirect_to user_events_path(current_user)
    end
  end
  def user_valid_show(event)
    if current_user.id != params[:user_id].to_i
      redirect_to user_event_path(current_user, event)
    end
  end
end
