class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.text :body
      t.datetime :start
      t.datetime :end

      t.timestamps null: false
    end
  end
end
