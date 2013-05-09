module RapidftrAddon
  class ExportTask
    extend Addon

    class Result
      attr_accessor :filename, :data

      def initialize(filename, data)
        @filename = filename
        @data = data
      end
    end

    def export(children)
      raise [ Result.new ]
    end
  end
end
