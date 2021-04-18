class CreateApis < ActiveRecord::Migration[6.1]
  def change
    create_table :apis do |t|
      t.json :json_data

      t.timestamps
    end
  end
end
