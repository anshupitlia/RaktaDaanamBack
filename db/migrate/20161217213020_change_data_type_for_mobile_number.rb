class ChangeDataTypeForMobileNumber < ActiveRecord::Migration[5.0]
  def self.up
    change_table :donors do |t|
      t.change :mobile_number, :string
    end
  end
  def self.down
    change_table :tablename do |t|
      t.change :mobile_number, :integer
    end
  end
end
