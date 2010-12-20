module ActiveSupport::Cache
  class Entry
    def value
      if @value
        compressed? ? Marshal.load(Zlib::Inflate.inflate(@value)) : @value
        # don't do any freezing because Mongoid hates that.
      end
    end
  end
end
