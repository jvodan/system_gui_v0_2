class CreateSystemLibraries < ActiveRecord::Migration[5.0]
  def change
    create_table :system_libraries do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
