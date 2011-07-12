# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
require File.join(File.dirname(__FILE__), "lib/blacklight_user_generated_content/version")
Gem::Specification.new do |s|
  s.name = "blacklight_user_generated_content"
  s.version = BlacklightUserGeneratedContent::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Chris Beer"]
  s.email = ["chris_beer@wgbh.org"]
  s.homepage = "http://projectblacklight.org"
  s.summary = "User Generated Content plugin for Blacklight"
  s.description = "Tags and Comments for Blacklight documents"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rails", "~> 3.0"
  s.add_dependency "blacklight", "~> 3.0"
  s.add_dependency "rsolr-ext"
  s.add_dependency "cancan"
  s.add_dependency "acts-as-taggable-on"
  s.add_dependency "acts_as_commentable"
end
