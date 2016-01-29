class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.datetime :call_date
      t.datetime :call_time
      t.datetime :duration

      t.timestamps null: false
    end
  end
end
