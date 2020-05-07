module NotificationsHelper
  
  def check_notification
    current_user.passive_notifications.where("checked = ?", false)
  end
end
