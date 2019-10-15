# frozen_string_literal: true

class QuestionBroadcastJob < ApplicationJob
  queue_as :question

  def perform(notifications)
    notifications.each do |notification|
      ActionCable.server.broadcast "question_channel_#{notification.user_id}",
                                   counter: render_counter(Notification.where(user_id: notification.user_id).not_seen.size)
    end
  end

  def render_counter(counter)
    ApplicationController.renderer.render(partial: "shared/counter",
                                          locals: { counter: counter })
  end
end
