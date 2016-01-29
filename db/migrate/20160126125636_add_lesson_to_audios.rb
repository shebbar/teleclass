class AddLessonToAudios < ActiveRecord::Migration
  def change
		add_reference :audio_files, :lesson, index: true
  end
end
