class DonorsController < ApplicationController
 def new
 end

 def get_donors_list
 	params = request.POST
 	eligible_donors = []
 	proximity_donors = []
 	if params.has_key?("lat") && params.has_key?("lng") && params.has_key?("blood_group")
 		eligible_donors = get_eligible_donors(params[:blood_group])
 		proximity_donors = get_donors_in_the_radius(eligible_donors, params[:lat], params[:lng])
 	end
 	respond_to do |format|
 		format.json { render :json => proximity_donors.to_json }
 	end
 end

 def verify
 	params = request.POST
 	if params.has_key?("mobile_number") && params.has_key?("password")
 		donor = Donor.exists?(:mobile_number => params[:mobile_number], :password => params[:password])
 		if (donor == true)
 			respond_to do |format|
    		format.json { head :ok }
		end
	end
  end
 end

 def create
  @donor = Donor.new(donor_params)
  if (@donor.save)
  	respond_to do |format|
    format.json { head :ok }
  end
  end
  
end
 
private
  def donor_params
    params.require(:donor).permit(:name, :mobile_number, :blood_group, :dob, :gender, :password, :last_donation_date, location: [:lat, :lng])
  end

  def get_eligible_donors(blood_group)
  	current_receiver = Donor.new({blood_group: blood_group})
  	eligible_donors = []
  	all_donors = Donor.all
  	all_donors.each do |donor|
	 	if (current_receiver.can_receive_from(donor))
	 		eligible_donors.push(donor)
	 	end
	end
	return eligible_donors
  end

 def get_donors_in_the_radius(eligible_donor_list, lat, lng)
 	donors_in_the_radius = []
 	current_location = Location.new({lat: lat, lng: lng})
	 eligible_donor_list.each do |donor|
	 	if current_location.get_distance(donor.location) <= 10
	 		donors_in_the_radius.push(donor)
		end
	end
	return donors_in_the_radius
 end

end
