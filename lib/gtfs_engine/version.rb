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
module GtfsEngine
  module Version
    # The following four lines are generated, so don't mess with them.
    MAJOR = 1
    MINOR = 0
    PATCH = 1
    BUILD = nil

    def self.to_s
      [MAJOR, MINOR, PATCH, BUILD].compact.join '.'
    end

    # A helper class which bumps the version number stored in this file
    class Bumper
      PARTS = %i[major minor patch]
      PATTERN = %r[(\s+)MAJOR = \d+\s+MINOR = \d+\s+PATCH = \d+\s+BUILD = .+]

      def initialize(filename=__FILE__, part)
        raise "#{part} not one of #{PARTS}" unless PARTS.include? part
        @filename, @part = filename, part
      end

      # Increase the version number and write it to this file
      def bump
        parts = new_version
        text = '\1' + ["MAJOR = #{parts[:major]}",
                       "MINOR = #{parts[:minor]}",
                       "PATCH = #{parts[:patch]}",
                       "BUILD = #{parts[:build] || 'nil'}"].join( '\1' )

        out_data = File.read( @filename ).gsub PATTERN, text
        #puts out_data
        File.open( @filename, 'w' ) { |out| out << out_data }
        puts "Bumped version to #{to_s}"
      end

      #@return [String] What the new version string will be.
      def to_s
        p = new_version
        [p[:major], p[:minor], p[:patch], p[:build]].compact.join ?.
      end

      private

      def new_version
        @vers ||= { major: MAJOR,
                    minor: MINOR,
                    patch: PATCH,
                    build: BUILD }.merge new_parts
      end

      def new_parts
        case @part
        when :major then {
            major: MAJOR + 1,
            minor: 0,
            patch: 0
        }
        when :minor then {
            minor: MINOR + 1,
            patch: 0
        }
        else {
            patch: PATCH + 1
        }
        end
      end
    end
  end
end
