# This file is part of the KNOWtime server.
#
# The KNOWtime server is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option) any
# later version.
#
# The KNOWtime server is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License
# along with the KNOWtime server.  If not, see <http://www.gnu.org/licenses/>.
require 'action_controller/responder'

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
    options[:status] ||= :unprocessable_entity

    controller.render status: options[:status], jsend: {
        error: 'could not process request', data: resource_errors[:errors]
    }
  end
end
