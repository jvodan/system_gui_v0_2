class CreatePortalEngines < ActiveRecord::Migration[5.0]
  def change
    create_table :portal_engines do |t|
      t.integer :portal_id
      t.integer :engine_id

      t.timestamps
    end
  end
end
