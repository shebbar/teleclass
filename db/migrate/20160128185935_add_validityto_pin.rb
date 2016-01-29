class AddValiditytoPin < ActiveRecord::Migration
  def change
		add_column :pins, :valid, :boolean, default: false
  end
end
