class GtfsEngine::JsonResponder < ActionController::Responder
  def to_json
    if has_errors?
      display_errors
    else
      default_render
    end
  end

  protected

  def display_errors
    status_code = options[:status] || :unprocessable_entity
    data = { status: 'error', data: resource_errors[:errors] }
    controller.render format => data, status: status_code
  end
end
