require 'rails/generators'
require 'rails/generators/base'
require 'rails/generators/migration'

class BlacklightUserGeneratedContentGenerator < Rails::Generators::Base 
  include Rails::Generators::Migration
  source_root File.expand_path('../templates', __FILE__)

# Implement the required interface for Rails::Generators::Migration.
   # taken from http://github.com/rails/rails/blob/master/activerecord/lib/generators/active_record.rb
   def self.next_migration_number(dirname)
     if ActiveRecord::Base.timestamped_migrations
       Time.now.utc.strftime("%Y%m%d%H%M%S")
     else
       "%.3d" % (current_migration_number(dirname) + 1)
     end
   end

  desc """
  """
  def generate_cancan_ability
    generate "cancan:ability"
  end

  def inject_comments_roles
    inject_into_file "app/models/ability.rb", :after => "def initialize(user)" do
    <<-EOF 

    user ||= User.new

    can :read, Comment
    can :create, Comment 
    can :manage, Comment, :user_id => user.id
    EOF
    end
  end

  def generate_acts_as_taggable_migrations
    generate "acts_as_taggable_on:migration"
  end

  def update_taggable_id_to_string_migration
    migration_template 'alter_taggable_id_to_string.rb', 'db/migrate/alter_taggable_id_to_string.rb'
  end

  def generate_acts_as_commentable_migrations
    generate "comment"
  end

  def add_comment_mixin
    inject_into_file "app/models/comment.rb", :after => "include ActsAsCommentable::Comment" do
      "\ninclude BlacklightUserGeneratedContent::Comment"
    end
  end

  def add_document_mixin
    inject_into_file "app/models/solr_document.rb", :after => "include Blacklight::Solr::Document" do
      "\ninclude BlacklightUserGeneratedContent::Document\n" +
      "include BlacklightUserGeneratedContent::Commentable\n" +
      "include BlacklightUserGeneratedContent::Taggable\n"
    end
  end
end
