class Donor < ApplicationRecord
	has_one :location

def as_json(options={})
  options[:only] ||= [:name, :mobile_number, :blood_group]
  options[:methods] ||= [:latitude, :longitude]
  super
end

def latitude
  self.location.lat
end

def longitude
  self.location.lng
end
end
