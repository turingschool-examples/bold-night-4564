class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.average_by(column)
    average(column)
  end

  def self.sort_by_input(column, order)
    order("#{column}": :"#{order}")
  end
end
