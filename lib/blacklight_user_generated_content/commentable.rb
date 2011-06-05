module BlacklightUserGeneratedContent::Commentable

  # `base` is likely /NOT/ a type of ActiveRecord::Base, the acts_as_commentable plugin is not automatically included
  def self.included base
    base.send :include, Juixe::Acts::Commentable
    base.send :acts_as_commentable
  end
end
