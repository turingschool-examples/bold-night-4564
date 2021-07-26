class AmusementParkController < ApplicationController
  validates :name, presence: true
  validates :price, presence: true
  validate_numericality_of :price, only_integer: :true

  has_many :mechanics
  has_many :rides
end
