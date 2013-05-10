require 'active_support/core_ext/class'

module RapidftrAddon
  module Addon
    attr_writer :enabled
    attr_writer :options

    def id
      raise "Not Implemented"
    end

    def enabled?
      @enabled
    end

    def options
      opts = {}
      self.ancestors.each do |clazz|
        opts.merge! clazz.options if clazz != self && clazz.is_a?(Addon)
      end
      opts.merge! @options if @options
      opts
    end

    def enable(options = nil)
      self.enabled = true
      self.options = options if options
    end

    def all
      descendants
    end

    def active
      descendants.select(&:enabled?)
    end

    def find_by_id(id)
      active.find { |impl| impl.id == id }
    end
  end
end
