module BlacklightUserGeneratedContent::Tags::UserOverride
  def self.included(base)
    base.class_eval do
      acts_as_tagger
    end
  end

end
