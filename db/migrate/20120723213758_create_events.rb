class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :actor
      t.string :username
      t.text :payload
      t.boolean :public
      t.string :repository
      t.string :event_type
      t.text :url

      t.timestamps
    end
    add_index :events, :actor_id
  end
end
