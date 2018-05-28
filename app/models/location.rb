class Location < ApplicationRecord
  belongs_to :company, optional: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
