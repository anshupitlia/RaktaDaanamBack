require 'date'
class Donor < ApplicationRecord
	has_one :location

def can_receive_from(donor)
	donor_receiver_map = {
	"AB+" => ["O-","O+","B-", "B+", "A-", "A+", "AB-", "AB+"],
	"AB-" => ["O-", "B-", "A-", "A+"],
	"A+"  => ["O-", "O+", "A-", "A+"],
	"A-"  => ["O-", "A-"],
	"B+"  => ["O-", "O+", "B-", "B+"],
	"B-"  => ["O-", "B-"],
	"O+"  => ["O-", "O+"],
	"O-"  => ["O-"],
}
	return donor_receiver_map[self.blood_group].include?(donor.blood_group)
end

def can_donate()
	now = Date.today
	fifty_six_days_ago = (now - 56)
	return self.last_donation_date < fifty_six_days_ago
end


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
