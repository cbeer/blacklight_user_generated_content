# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "blacklight_user_generated_content"
  s.summary = "Insert BlacklightUserGeneratedContent summary."
  s.description = "Insert BlacklightUserGeneratedContent description."
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.version = "0.0.1"

  s.add_dependency "rails", "~> 3.0"
  s.add_dependency "blacklight" #, "~> 3.0"
  s.add_dependency "rsolr-ext"
  s.add_dependency "cancan"
  s.add_dependency "acts-as-taggable-on"
  s.add_dependency "acts_as_commentable"
end
