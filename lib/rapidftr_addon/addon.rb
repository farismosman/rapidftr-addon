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

    def name
      raise "Not Implemented"
    end

    def implementations
      descendants.select(&:enabled?)
    end
  end
end
