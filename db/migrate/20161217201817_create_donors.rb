class CreateDonors < ActiveRecord::Migration[5.0]
  def change
    create_table :donors do |t|
      t.string :name
      t.integer :mobile_number
      t.string :blood_group
      t.date :dob
      t.string :gender
      t.string :password
      t.date :last_donation_date

      t.timestamps
    end
  end
end
