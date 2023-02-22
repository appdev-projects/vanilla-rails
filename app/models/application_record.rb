class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.ransackable_attributes(auth_object = nil)
    ["assessment", "created_at", "id", "name", "number", "question", "spiritual_type", "updated_at"]
  end
  
end
