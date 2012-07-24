class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.text :blog
      t.string :company
      t.string :email
      t.string :gravatar_id
      t.string :location
      t.string :login
      t.string :name
      t.string :actor_type

      t.timestamps
    end
  end
end
