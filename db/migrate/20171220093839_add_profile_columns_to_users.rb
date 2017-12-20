class AddProfileColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :prefecture, :string
    add_column :users, :address, :string
    add_column :users, :station, :string
    add_column :users, :final_education, :string
    add_column :users, :school_name, :string
    add_column :users, :graduate_date, :string
    add_column :users, :wheelchair, :string
    add_column :users, :car_commute, :string
    add_column :users, :phone_support, :string
    add_column :users, :commute_time, :string
    add_column :users, :overtime, :string
    add_column :users, :available_overtime_hour, :integer
    add_column :users, :ambulatory, :string
    add_column :users, :available_ambulatory_count, :integer
    add_column :users, :dialysis, :string
    add_column :users, :available_dialysis_count, :integer
    add_column :users, :special_equipment, :string
    add_column :users, :skill, :string
    add_column :users, :personal_summary, :text
    add_column :users, :require_first_occupation, :string
    add_column :users, :require_second_occupation, :string
    add_column :users, :require_location, :text
    add_column :users, :require_employment_type, :string
    add_column :users, :require_low_income, :integer
    add_column :users, :require_high_income, :integer
  end
end
