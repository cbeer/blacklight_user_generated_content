module BlacklightUserGeneratedContent::Rating::SurrogateOverride
  def self.included(base)
    base.class_eval do
      acts_as_rateable
    end
  end

end
