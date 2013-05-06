require 'active_support/core_ext/class'

module RapidftrAddons
  module Addon
    def enabled?
      true
    end

    def name
      raise "Not Implemented"
    end

    def implementations
      descendants.select(&:enabled?)
    end
  end
end
