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

# def index
# 		@donors = Donor.all
# 		respond_to do |format|
#       		format.json { render :json => @donors.to_json }
#       	end
# 	end

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
  	return Donor.all
  end

 def get_donors_in_the_radius(eligible_donor_list, lat, lng)
 	return eligible_donor_list
 end

end
