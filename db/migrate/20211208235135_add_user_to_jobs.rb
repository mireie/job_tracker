class AddUserToJobs < ActiveRecord::Migration[6.1]
  def change
    add_reference :jobs, :user, foreign_key: true
    add_column :users, :token, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
