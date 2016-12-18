class Donor < ApplicationRecord
	has_one :location

def can_receive_from(donor)
	donor_receiver_map = {
	"ab+" => ["o-","o+","b-", "b+", "a-", "a+", "ab-", "ab+"],
	"ab-" => ["o-", "b-", "a-", "a+"],
	"a+"  => ["o-", "o+", "a-", "a+"],
	"a-"  => ["o-", "a-"],
	"b+"  => ["o-", "o+", "b-", "b+"],
	"b-"  => ["o-", "b-"],
	"o+"  => ["o-", "o+"],
	"o-"  => ["o-"],

}
	return donor_receiver_map[self.blood_group].include?(donor.blood_group)
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
