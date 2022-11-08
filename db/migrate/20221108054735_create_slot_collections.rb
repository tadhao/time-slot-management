class CreateSlotCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :slot_collections do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :slot, null: false, foreign_key: true
      t.integer :capacity

      t.timestamps
    end
  end
end
