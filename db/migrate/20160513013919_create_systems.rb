class CreateSystems < ActiveRecord::Migration[5.0]
  def change
    create_table :systems do |t|
      t.string   :label
      t.string   :default_domain
      t.string   :admin_banner
      t.string   :text_color
      t.string   :background_color
      t.string   :icon_file_name
      t.string   :icon_content_type
      t.integer  :icon_file_size
      t.datetime :icon_updated_at
      t.text     :portal_header
      t.text     :portal_footer
      t.boolean  :portal_center_align

      t.timestamps
    end
  end
end
