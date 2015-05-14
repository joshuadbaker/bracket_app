class User < ActiveRecord::Base
  validates_numericality_of :address
end
