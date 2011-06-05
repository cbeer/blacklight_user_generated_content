module BlacklightUserGeneratedContent
  module Findable
    # Override RSolr finder method to mock ActiveRecord#find
    # Provide  a mock method for #find
    # XXX this seems slightly dangerous as is, but seems to work well enough
    def find *args
      if args.first.is_a? String
        return super(:qt => :document, :id => args.first).first
      end
      super(*args)
    end
  end
end
