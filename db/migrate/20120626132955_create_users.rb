class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
		t.string	:email
		t.string :password, :limit =>40
		t.string :name
		t.text :profile, :text
		t.boolean :admin, :defailt => false
		t.timestamps
    end
  end
end
