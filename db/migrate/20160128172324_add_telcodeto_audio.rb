class AddTelcodetoAudio < ActiveRecord::Migration
  def change
		add_column :audio_files, :telephone_code, :string
  end
end
