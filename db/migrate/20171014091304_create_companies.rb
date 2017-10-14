class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.boolean :admin
      t.text :description
      t.string :name, nulll: false, default: ""
      t.string :establishment_date
      t.string :representative
      t.string :employees
      t.string :capital
      t.string :business
      t.string :url

      t.timestamps
    end
  end
end
