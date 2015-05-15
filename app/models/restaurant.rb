class Restaurant < ActiveRecord::Base
  serialize :violations
  serialize :violation_descriptions
end
