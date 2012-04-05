class AddIndexForClassificationHeadingIdToClassification < ActiveRecord::Migration
  def change
    add_index :classifications, :classification_heading_id
  end
end
