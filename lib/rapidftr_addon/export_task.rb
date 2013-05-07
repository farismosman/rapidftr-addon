module RapidftrAddon
  class ExportTask
    extend Addon

    # Will yield a filename for each exported record
    def export(children)
      raise "Not Implemented"
    end
  end
end
