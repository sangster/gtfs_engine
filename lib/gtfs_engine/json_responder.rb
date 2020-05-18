# frozen_string_literal: true

require 'action_controller/responder'

class GtfsEngine::JsonResponder < ActionController::Responder
  def to_json(*_args)
    has_errors? ? display_errors : default_render
  end

  protected

  def display_errors
    options[:status] ||= :unprocessable_entity

    controller.render(
      status: options[:status],
      jsend: { error: 'could not process request',
               data: resource_errors[:errors] }
    )
  end
end
