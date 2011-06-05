module BlacklightUserGeneratedContent::ActiveRecordDuckType

  def self.included base
    # ActiveModel/ActiveRecord stuff
    base.send :include, ActiveModel::Observing
    base.send :extend, ActiveModel::Naming
    base.send :extend, ActiveModel::Callbacks
    base.send :extend, ActiveModel::Observing
    base.send :define_model_callbacks, :destroy, :save
    base.send :include, ActiveRecord::Associations
    base.send :include, ActiveRecord::Reflection

    # Mock ActiveRecord methods only to the extent required
    base.send :extend, ActiveRecordClassMethods
    base.send :include, ActiveRecordInstanceMethods
  end

  # ActiveRecord mock methods
  module ActiveRecordClassMethods
    def base_class
      self
    end

    def primary_key
      :id
    end
    
    def compute_type(type_name)
      ActiveSupport::Dependencies.constantize(type_name)
    end
    
    def quote_value *args
      ActiveRecord::Base.quote_value *args
    end
    
    def table_exists?
       false
    end
  end

  
  # ActiveRecord instance mock methods
  module ActiveRecordInstanceMethods
    def quoted_id
      ActiveRecord::Base.quote_value id
    end
  
    def interpolate_sanitized_sql *args
      active_record_model.send :interpolate_sanitized_sql, *args
    end
    def interpolate_and_sanitize_sql *args
      # XXX interpolate_and_sanitize_sql is an ActiveRecord::Base method,
      # XXX rather than create a mock object or something, just use a model we know a priori exists
      active_record_model.send  :interpolate_and_sanitize_sql, *args
    end
  
    def new_record?
      false
    end
  
    def destroyed?
      false
    end

    def persisted?
      false
    end

    private
    def active_record_model
      ActsAsTaggableOn::Tag.new
    end
  end

  def save
    _run_save_callbacks do
    end
  end

end

