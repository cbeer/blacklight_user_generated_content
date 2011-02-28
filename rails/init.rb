require 'blacklight'
require 'blacklight_user_generated_content'

config.gem "acts-as-taggable-on", :source => "http://gemcutter.org", :version => '2.0.0.rc1'
config.gem 'jackdempsey-acts_as_commentable', :lib => 'acts_as_commentable', :source => "http://gems.github.com"
config.gem "acts_as_rateable"


# We do our injection in after_initialize so an app can stop it or configure
# it in an initializer, using BlacklightUserGeneratedContent.omit_inject .
# Only weirdness about this is our CSS will always be last, so if an app
# wants to over-ride it, might want to set BlacklightUserGeneratedContent.omit_inject => {:css => true}
config.after_initialize do 
  BlacklightUserGeneratedContent.inject!
end
