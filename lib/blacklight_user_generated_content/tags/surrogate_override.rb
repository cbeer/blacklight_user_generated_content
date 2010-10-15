module BlacklightUserGeneratedContent::Tags::SurrogateOverride
  def self.included(base)
    base.class_eval do
      acts_as_taggable_on :tags
    end
  end

end
