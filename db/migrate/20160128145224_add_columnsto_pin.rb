class AddColumnstoPin < ActiveRecord::Migration
  def change
		add_reference :pins, :user, index: true
  end
end
