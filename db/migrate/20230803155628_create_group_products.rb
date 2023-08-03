class CreateGroupProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :group_products do |t|
      t.references :group, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
