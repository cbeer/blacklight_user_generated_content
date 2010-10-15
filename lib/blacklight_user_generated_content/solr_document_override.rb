module BlacklightUserGeneratedContent::SolrDocumentOverride
  def self.included(base)
  end

  def surrogate
    @surrogate ||= Surrogate.with_id id 
  end

  def save
    @surrogate.save!
    @surrogate = Surrogate.with_id id
    nil
  end
end
