class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :note
      
      t.timestamps
    end
    add_reference :notes, :job, foreign_key: true
  end
end
