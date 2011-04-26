require 'blacklight_user_generated_content'
require 'acts_as_rateable'

# We do our injection in to_prepare so an app can stop it or configure
# it in an initializer, using BlacklightUserGeneratedContent.omit_inject .
# Only weirdness about this is our CSS will always be last, so if an app
# wants to over-ride it, might want to set BlacklightUserGeneratedContent.omit_inject => {:css => true}
config.to_prepare do 
  BlacklightUserGeneratedContent.inject!
end
