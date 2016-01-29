class ChangeCallDurationType < ActiveRecord::Migration
  def change
		change_column :calls, :duration, :string
  end
end
