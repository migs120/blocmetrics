class Event < ActiveRecord::Base
  belongs_to :site
  
  default_scope { order('created_at DESC') }
end
