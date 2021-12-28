class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :content
      
      t.timestamps
    end
    add_reference :notes, :job, foreign_key: true
  end
end
