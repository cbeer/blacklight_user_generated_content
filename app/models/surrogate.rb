class Surrogate  < ActiveRecord::Base
  def self.columns()
    @columns ||= [];
  end

  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end

  def save
  end

  def new_record?
        false
  end

  def update
  end

  column :id, :string
  column :title, :string

  def self.with_id id
    s = Surrogate.new
    s.id = id
    s
  end
end
