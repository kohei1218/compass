class CreateRecruitImages < ActiveRecord::Migration[5.1]
  def change
    create_table :recruit_images do |t|
      t.string :file_name
      t.integer :order
      t.belongs_to :recruit, index: true

      t.timestamps
    end
  end
end
