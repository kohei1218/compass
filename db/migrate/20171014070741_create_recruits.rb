class CreateRecruits < ActiveRecord::Migration[5.1]
  def change
    create_table :recruits do |t|
      t.belongs_to :company, index: true

      t.string :occupation, null: false
      t.text :description, null: false
      t.text :qualification, null: false
      t.text :employment_type, null: false
      t.text :salary, null: false
      t.text :welfare, null: false
      t.text :office_hours, null: false
      t.text :holiday, null: false
      t.text :location, null: false
      t.text :consideration
      t.text :information
      t.text :screening_process

      t.timestamps
    end
  end
end
