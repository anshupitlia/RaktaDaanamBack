# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

donors = Donor.create([
	{id: 1, name: "Dharmendra", mobile_number: "776060924707", blood_group: "B+", dob: "14/10/1991", gender: "Male", password: "p@ss123", last_donation_date: "03/04/2016"},
	{id: 2, name: "Ale", mobile_number: "9986756538", blood_group: "O+", dob: "12/12/1990", gender: "Male", password: "p@ss123", last_donation_date: "03/05/2016"},
	{id: 3, name: "Anshu", mobile_number: "9739395341", blood_group: "O+", dob: "23/06/1991", gender: "Female", password: "p@ss123", last_donation_date: "15/12/2016"},
	{id: 4, name: "Dharm", mobile_number: "8951272242", blood_group: "O-", dob: "12/12/1990", gender: "Male", password: "p@ss123", last_donation_date: "03/04/2016"},
	{id: 5, name: "Anu", mobile_number: "9731125303", blood_group: "O+", dob: "13/12/1989", gender: "Female", password: "p@ss123", last_donation_date: "03/04/2016"}
	])


locations = Location.create([
	{donor_id: 1, lat: "80.2600098", lng: "13.0532621"},
	{donor_id: 2, lat: "80.2601098", lng: "13.0532631"},
	{donor_id: 3, lat: "80.2600198", lng: "13.0532521"},
	{donor_id: 4, lat: "80.2610098", lng: "13.0533621"},
	{donor_id: 5, lat: "90.2500098", lng: "31.0522621"},
	])


