module RapidftrAddon
  class ExportTask
    extend Addon

    class Result < Struct.new(:filename, :data)
    end

    def export(children)
      raise [ Result.new ]
    end
  end
end
