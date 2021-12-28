class RemoveNotesFromJob < ActiveRecord::Migration[6.1]
  def change
    remove_column :jobs, :notes
  end
end
