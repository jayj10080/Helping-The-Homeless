class Place < ApplicationRecord
  has_many :helpers
  has_many :helpees
end
