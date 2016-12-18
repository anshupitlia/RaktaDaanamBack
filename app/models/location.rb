class Location < ApplicationRecord
  belongs_to :donor

  def get_distance(location)
  	Haversine.distance(self.lat, self.lng, location.lat, location.lng).to_kilometers
  end
end
