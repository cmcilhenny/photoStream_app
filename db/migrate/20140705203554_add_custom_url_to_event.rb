class AddCustomUrlToEvent < ActiveRecord::Migration
  def change
    add_column :events, :custom_url, :string
  end
end
