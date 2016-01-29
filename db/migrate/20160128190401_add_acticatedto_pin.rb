class AddActicatedtoPin < ActiveRecord::Migration
  def change
		remove_column :pins, :valid
		add_column :pins, :activated, :boolean, default: false
  end
end
