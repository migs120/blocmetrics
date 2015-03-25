class Site < ActiveRecord::Base
  belongs_to :user
  has_many :events, dependent: :destroy
  
  default_scope { order('created_at DESC') }
  
end
