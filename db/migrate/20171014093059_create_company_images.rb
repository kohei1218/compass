class CreateCompanyImages < ActiveRecord::Migration[5.1]
  def change
    create_table :company_images do |t|
      t.string :file_name
      t.integer :order
      t.belongs_to :company

      t.timestamps
    end
  end
end
