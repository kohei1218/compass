class CreateViewLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :view_logs do |t|
      t.belongs_to :user, index: true
      t.belongs_to :recruit, index: true

      t.timestamps
    end
  end
end
