# BlacklightUserGeneratedContent

module BlacklightUserGeneratedContent
  @omit_inject = {}
  def self.omit_inject=(value)
    value = Hash.new(true) if value == true
    @omit_inject = value      
  end
  def self.omit_inject ; @omit_inject ; end
  
  def self.inject!
    Dispatcher.to_prepare do
      unless omit_inject[:solrdocument_mixin]
         SolrDocument.send(:include, BlacklightUserGeneratedContent::SolrDocumentOverride) unless SolrDocument.include?(BlacklightUserGeneratedContent::SolrDocumentOverride)
      end

     unless omit_inject[:tags]
      unless omit_inject[:surrogate_mixin]
         Surrogate.send(:include, BlacklightUserGeneratedContent::Tags::SurrogateOverride) unless Surrogate.include?(BlacklightUserGeneratedContent::Tags::SurrogateOverride)
      end
      unless omit_inject[:solrdocument_mixin]
         SolrDocument.send(:include, BlacklightUserGeneratedContent::Tags::SolrDocumentOverride) unless SolrDocument.include?(BlacklightUserGeneratedContent::Tags::SolrDocumentOverride)
      end

      unless omit_inject[:user_mixin]
         User.send(:include, BlacklightUserGeneratedContent::Comments::UserOverride) unless User.include?(BlacklightUserGeneratedContent::Comments::UserOverride)
      end

     end


     unless omit_inject[:comments]
      unless omit_inject[:surrogate_mixin]
         Surrogate.send(:include, BlacklightUserGeneratedContent::Comments::SurrogateOverride) unless Surrogate.include?(BlacklightUserGeneratedContent::Comments::SurrogateOverride)
      end
      unless omit_inject[:solrdocument_mixin]
         SolrDocument.send(:include, BlacklightUserGeneratedContent::Comments::SolrDocumentOverride) unless SolrDocument.include?(BlacklightUserGeneratedContent::Comments::SolrDocumentOverride)
      end

      unless omit_inject[:user_mixin]
         User.send(:include, BlacklightUserGeneratedContent::Comments::UserOverride) unless User.include?(BlacklightUserGeneratedContent::Comments::UserOverride)
      end

     end

     unless omit_inject[:rating]
      unless omit_inject[:surrogate_mixin]
         Surrogate.send(:include, BlacklightUserGeneratedContent::Rating::SurrogateOverride) unless Surrogate.include?(BlacklightUserGeneratedContent::Rating::SurrogateOverride)
      end
      unless omit_inject[:solrdocument_mixin]
         SolrDocument.send(:include, BlacklightUserGeneratedContent::Rating::SolrDocumentOverride) unless SolrDocument.include?(BlacklightUserGeneratedContent::Rating::SolrDocumentOverride)
      end

      unless omit_inject[:user_mixin]
         User.send(:include, BlacklightUserGeneratedContent::Rating::UserOverride) unless User.include?(BlacklightUserGeneratedContent::Rating::UserOverride)
      end

     end

    end
  end

  # Add element to array only if it's not already there
  def self.safe_arr_add(array, element)
    array << element unless array.include?(element)
  end
  
end
