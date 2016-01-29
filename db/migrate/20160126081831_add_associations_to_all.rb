class AddAssociationsToAll < ActiveRecord::Migration
  def change
		add_reference :lessons, :subject, index: true
		add_reference :lessons, :audio_file, index: true
		add_reference :users, :pin, index: true
		add_reference :registrations, :pin, index: true
		add_reference :registrations, :user, index: true
		add_reference :registrations, :subject, index: true
		add_index :registrations, [:pin_id, :user_id], unique: true, :name => 'index_pin_users'
		add_index :registrations, [:pin_id, :subject_id], unique: true, :name => 'index_pin_subjects'
		add_reference :calls, :pin, index: true
		add_reference :calls, :lesson, index: true
		add_index :calls, [:pin_id, :lesson_id], unique: false, :name => 'index_pin_lessons'
		change_column :calls, :call_date, :date
		change_column :calls, :call_time, :time
  end
end
