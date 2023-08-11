# frozen_string_literal: true

# A point in the map, with a name.
class Place < ApplicationRecord
  validates :name, presence: true

  validates :latitude, presence: true
  validates :longitude, presence: true
end
