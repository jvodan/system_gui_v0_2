class CreateMachines < ActiveRecord::Migration[5.0]
  def change
    create_table :machines do |t|
      t.string   :label
      t.string   :ip
      t.string   :secret

      t.timestamps
    end
  end
end
