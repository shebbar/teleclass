class ChangeCallsAddColumns < ActiveRecord::Migration
  def change
		add_column :calls, :pin_code, :string, index: true
		add_column :calls, :lesson_code, :string, index: true
		add_column :calls, :subject_code, :string, index: true
		add_index :calls, [:pin_code, :lesson_code, :subject_code], unique: false, :name => 'index_pin_sub_lessons'
  end
end
