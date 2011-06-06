class UserGeneratedContentController < CatalogController
  include BlacklightUserGeneratedContent::SolrHelper::Scope
  helper BlacklightUserGeneratedContent::Helper
end
