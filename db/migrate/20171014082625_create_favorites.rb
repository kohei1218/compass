class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.belongs_to :user, index: true
      t.belongs_to :recruit, index: true

      t.timestamps
    end
    add_index :favorites, [:user_id, :recruit_id], unique: true
  end
end
