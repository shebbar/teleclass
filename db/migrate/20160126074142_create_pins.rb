class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :pincode
      t.string :serialcode

      t.timestamps null: false
    end
  end
end
