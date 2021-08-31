class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :title
      t.string :url
      t.string :cover_letter_url
      t.string :resume_url
      t.date :submission_date
      t.text :notes
      t.date :response_date

      t.timestamps
    end
  end
end
