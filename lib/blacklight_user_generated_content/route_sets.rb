module BlacklightUserGeneratedContent
  module RouteSets
    protected
    def catalog
      add_routes do |options|
        resources :catalog, :only => [:index, :show, :update] do
          resources :comments
          resource :tags
        end
      end

      super
    end

  end
end
