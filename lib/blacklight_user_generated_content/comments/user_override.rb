module BlacklightUserGeneratedContent::Comments::UserOverride
  def self.included(base)
  end

  def comments
    Surrogate.find_comments_by_user(self)
  end

end
