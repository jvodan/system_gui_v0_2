class CreatePortals < ActiveRecord::Migration[5.0]
  def change
    create_table :portals do |t|
      t.string   :label
      t.string   :text_color
      t.string   :background_color
      t.text     :header
      t.text     :footer
      t.boolean  :public
      t.boolean  :show_navbar
      t.boolean  :center_align
      t.string   :icon_file_name
      t.string   :icon_content_type
      t.integer  :icon_file_size
      t.datetime :icon_updated_at
      t.string   :wallpaper_file_name
      t.string   :wallpaper_content_type
      t.integer  :wallpaper_file_size
      t.datetime :wallpaper_updated_at

      t.timestamps
    end
  end
end
