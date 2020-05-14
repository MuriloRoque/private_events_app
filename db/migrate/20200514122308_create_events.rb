class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :description
      t.integer :creator_id

      t.timestamps
    end
  end
end
