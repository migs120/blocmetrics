class AddSiteToEvents < ActiveRecord::Migration
  def change
    add_column :events, :site_id, :integer
    add_index :events, :site_id
  end
end
