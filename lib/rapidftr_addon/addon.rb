require 'active_support/core_ext/class'

module RapidftrAddon
  module Addon
    def enabled?
      @enabled
    end

    def enable
      @enabled = true
    end

    def disable
      @enabled = false
    end

    def addon_id
      raise "Not Implemented"
    end

    def implementations
      descendants.select(&:enabled?)
    end

    def find_by_addon_id(id)
      implementations.find { |impl| impl.addon_id == id }
    end
  end
end
