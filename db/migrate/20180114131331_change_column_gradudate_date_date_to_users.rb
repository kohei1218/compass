class ChangeColumnGradudateDateDateToUsers < ActiveRecord::Migration[5.1]
  def up
    change_column :users, :graduate_date, 'date USING CAST(graduate_date AS date)'
  end

  def down
    change_column :users, :graduate_date, :string
  end
end
