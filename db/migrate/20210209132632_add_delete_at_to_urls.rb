class AddDeleteAtToUrls < ActiveRecord::Migration[6.1]
  def change
    add_column :urls, :deleted_at, :datetime
    add_index :urls, :deleted_at
  end
end
