module BlacklightUserGeneratedContent
  module SolrHelper
    module Scope
      def self.included(some_class)
        some_class.solr_search_params_logic << :restrict_to_user_generated_content_scope
      end
  
      def restrict_to_user_generated_content_scope solr_parameters, user_parameters
        solr_parameters[:fq] ||= []
        if current_user
          if current_user.has_role? :admin and user_params[:all]
            solr_parameters[:fq] << "comments_ids_i:[* TO *]"
          else
            solr_parameters[:fq] << "comments_user_ids_i:#{current_user.id} OR tags_user_ids_i:#{current_user.id}"
          end
        else
          solr_parameters[:fq] << "comments_public_b:true"
        end
      end
    end
  end
end

