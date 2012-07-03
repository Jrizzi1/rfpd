class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
	t.date	:meets_on
	t.string :location
	t.text	:description

      t.timestamps
    end
  end
end
