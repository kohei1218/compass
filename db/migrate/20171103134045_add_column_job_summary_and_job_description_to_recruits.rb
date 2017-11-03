class AddColumnJobSummaryAndJobDescriptionToRecruits < ActiveRecord::Migration[5.1]
  def change
    add_column :recruits, :job_summary, :string, null:false
    add_column :recruits, :job_description, :text, null:false
  end
end
