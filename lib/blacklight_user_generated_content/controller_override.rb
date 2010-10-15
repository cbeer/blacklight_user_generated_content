# Meant to be applied on top of a controller that implements
# Blacklight::SolrHelper. 
module BlacklightUserGeneratedContent::ControllerOverride
  def self.included(some_class)
  end

  # Uses Blacklight.config, needs to be modified when
  # that changes to be controller-based. This is the only method
  # in this plugin that accesses Blacklight.config, single point
  # of contact. 
  def user_generated_content_config   
    Blacklight.config[:user_generated_content] || {}
  end
end
