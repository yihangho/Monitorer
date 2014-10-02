class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.integer :status_code
      t.float :load_time
      t.integer :site_id

      t.index :site_id

      t.timestamps
    end
  end
end
