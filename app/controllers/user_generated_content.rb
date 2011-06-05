class UserGeneratedContentController < CatalogController
  include UserGeneratedContent::SolrHelper::Scope
  helper UserGeneratedContent::Helper
end
