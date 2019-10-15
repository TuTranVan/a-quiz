# frozen_string_literal: true

class NotificationUpdateJob < ApplicationJob
  queue_as :notification_update

  def perform(notification)
    counter = Notification.where(user_id: notification.user_id).not_seen.size
    ActionCable.server.broadcast "notification_update_channel_#{notification.user_id}",
                                 counter: render_counter(counter)
  end

  private

  def render_counter(counter)
    ApplicationController.renderer.render(partial: "shared/counter",
                                          locals: { counter: counter })
  end
end
