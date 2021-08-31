class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.text :event
      t.date :date
      t.text :contact_name
      t.text :contact_title
      t.date :follow_up_date
      t.boolean :follow_up

      t.timestamps
    end
  end
end
