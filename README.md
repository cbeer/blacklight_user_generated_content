# Blacklight

This is a plugin for [Blacklight](http://projectblacklight.org) that adds a basic layer of ActiveRecord-esque mocking to a Blacklight::Document/RSolr::Ext::Model class that allows it to work seamlessly with (some) extant Ruby on Rails plugins to provide "user generated content" features.

Currently, acts-as-taggable-on and acts_as_commentable are two integrations supplied by the plugin, although additional integrations should be trivial. 

## Installation

(Add blacklight_user_generated_content to your gemfile)
$ rails generate blacklight_user_generated_content
      generate  cancan:ability # cancan authorization framework
      create  app/models/ability.rb 
      insert  app/models/ability.rb
      generate  acts_as_taggable_on:migration
      create db/migrate/20110228210334_acts_as_taggable_on_migration.rb # acts as taggable expects the taggable_id to be an int. A solr document primary key may also be a string.
      create  db/migrate/20110606124459_alter_taggable_id_to_string.rb
      generate  comment
      create  app/models/comment.rb
      insert  app/models/comment.rb
      insert  app/models/solr_document.rb

$ rake db:migrate

Through the Rails Engine framework, this plugin also provides resourceful controllers for tags and comments, and provides an example catalog index of user generated content.

## TODO
This plugin depends on 'cancan', an authorization framework, to restrict Comment management to the original author. Ideally, this would either be optional or pluggable.

The user generated content "index" currently requires additional information to be indexed within Solr. This integration is not provided by this plugin, however, which may limit its utility.

This plugin has only been tested against master/HEAD versions of acts-as-taggable-on and acts_as_commentable. Some stable releases of these plugins have known issues.
