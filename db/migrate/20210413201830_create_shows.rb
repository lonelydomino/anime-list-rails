class CreateShows < ActiveRecord::Migration[6.1]
  def change
    create_table :shows do |t|
      t.string :name
      t.string :desc
      t.string :image
      t.integer :api_id

      t.timestamps
    end
  end
end
