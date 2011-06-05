require 'blacklight'
require 'blacklight_user_generated_content'

module BlacklightUserGeneratedContent
  class Engine < Rails::Engine
    initializer 'blacklight_user_generated_content.init', :after => 'blacklight.init' do |app|

    end

    config.to_prepare do
      # BlacklightUserGeneratedContent.inject!

      unless BlacklightUserGeneratedContent.omit_inject[:routes]
        Blacklight::Routes.send(:include, BlacklightUserGeneratedContent::RouteSets)
      end
    end

  end
end
