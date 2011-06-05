class AlterTaggableIdToString < ActiveRecord::Migration
  def self.up
    remove_index :taggings, [:taggable_id, :taggable_type, :context]
    change_column :taggings, :taggable_id, :string
    add_index :taggings, [:taggable_id, :taggable_type, :context]
  end

  def self.down
    remove_index :taggings, [:taggable_id, :taggable_type, :context]
    change_column :taggings, :taggable_id, :integer
    add_index :taggings, [:taggable_id, :taggable_type, :context]
  end
end
