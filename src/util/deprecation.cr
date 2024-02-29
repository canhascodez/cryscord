require "log"

module Cryscord::Deprecation
  class DeprecationError < Exception; end

  LOG = ::Log.for("deprecation")

  macro deprecated_field(name, deprecated, removed, current = Discord::API_VERSION)
    {% dep = current > deprecated || current == deprecated %}
    {% rem = current > removed || current == removed %}
    {% if dep || rem %}
      def {{name.id}}
        {% if rem %}
          message = "The field `{{name.id}}` has been removed in Discord API version {{removed.id}}"
          raise Cryscord::Deprecation::DeprecationError.new(message)
        {% else %}
          Cryscord::Deprecation::LOG.warn { "The field `{{name.id}}` has been deprecated in Discord API version {{deprecated.id}}" }
          previous_def
        {% end %}
      end
    {% end %}
  end
end
