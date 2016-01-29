class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :mobile
			t.boolean :admin, default: false
			t.string :activation_digest
			t.boolean :activated, default: false
			t.datetime :activated_at 
			t.string :password_digest
			t.string :remember_digest
			t.string :reset_digest
			t.datetime :reset_sent_at
      t.timestamps null: false
    end
  end
end
