# Meant to be applied on top of Blacklight helpers
module BlacklightHighlightField::SolrHelperOverride
  def self.included(base)
    base.alias_method_chain :get_search_results, :context
  end

  def get_search_results_with_context(extra_controller_params={})
    solr_response = Blacklight.solr.find(  self.solr_search_params(extra_controller_params) )
    document_list = solr_response.docs.collect {|doc| SolrDocument.new(doc, solr_response) }

     return [solr_response, document_list]
  end
end
