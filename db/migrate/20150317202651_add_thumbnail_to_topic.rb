class AddThumbnailToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :thumbnail, :string
  end
end
