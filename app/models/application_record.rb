class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.alphabetize
    order(:name)
  end
end
