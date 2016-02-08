class ChangeCalls < ActiveRecord::Migration
  def change
		remove_reference :calls, :pin
    remove_reference :calls, :lesson
  end
end
