class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :picture_url
      t.references :owner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
