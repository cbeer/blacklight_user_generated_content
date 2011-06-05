require 'acts-as-taggable-on'
module BlacklightUserGeneratedContent::Taggable
  # `base` is likely /NOT/ a type of ActiveRecord::Base, the acts_as_taggable_on plugin is not automatically included
  def self.included base
    base.send :extend, ActsAsTaggableOn::Taggable
    base.send :acts_as_taggable_on, :tags
  end
end
