class CreateJobApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :job_applications do |t|
      t.belongs_to :user, index: true
      t.belongs_to :recruit, index: true

      t.timestamps
    end
  end
end
