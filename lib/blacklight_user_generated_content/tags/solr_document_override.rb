module BlacklightUserGeneratedContent::Tags::SolrDocumentOverride
  def self.included(base)
  end
  def tags
    surrogate.tags
  end
  def tag_counts
    surrogate.tag_counts
  end
  def tag_list
    surrogate.tag_list
  end
  def tag_list= str
    surrogate.tag_list= str
  end

end
