require 'cancan'
require 'acts_as_commentable'
require 'acts-as-taggable-on'

module BlacklightUserGeneratedContent
  autoload :ActiveRecordDuckType, 'blacklight_user_generated_content/active_record_duck_type'
  autoload :Findable, 'blacklight_user_generated_content/findable'
  autoload :Document, 'blacklight_user_generated_content/document'
  autoload :SolrHelper, 'blacklight_user_generated_content/solr_helper'
  autoload :Taggable, 'blacklight_user_generated_content/taggable'
  autoload :Commentable, 'blacklight_user_generated_content/commentable'
  autoload :Comment, 'blacklight_user_generated_content/comment'
  autoload :RouteSets, 'blacklight_user_generated_content/route_sets'
  autoload :Helper, 'blacklight_user_generated_content/helper'

  require 'blacklight_user_generated_content/engine' if defined?(Rails)

  @omit_inject = {}

  def self.omit_inject=(value)
    value = Hash.new(true) if value == true
    @omit_inject = value      
  end

  def self.omit_inject ; @omit_inject ; end


end
