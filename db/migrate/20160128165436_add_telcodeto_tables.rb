class AddTelcodetoTables < ActiveRecord::Migration
  def change
		add_column :subjects, :sub_id, :string
		add_column :lessons, :les_id, :string
  end
end
