module BlacklightUserGeneratedContent::Rating::SolrDocumentOverride
  def self.included(base)
  end
  def rate_it rating, user 
    surrogate.rate_it rating, user
  end
  def average_rating
    surrogate.average_rating
  end
  def average_rating_round
    surrogate.average_rating_round
  end

  def average_rating_percent
    surrogate.average_rating_percent
  end
  def rated_by? user
    surrogate.rated_by? user
  end

  def self.find_average_of rating
    Surrogate.find_average_of rating
  end
end
