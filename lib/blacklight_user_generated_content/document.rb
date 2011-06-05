module BlacklightUserGeneratedContent
  module Document
    def self.included(base)
      base.send :include, BlacklightUserGeneratedContent::ActiveRecordDuckType
      base.send :extend, BlacklightUserGeneratedContent::Findable
    end
  end
end
