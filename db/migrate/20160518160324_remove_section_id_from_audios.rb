class RemoveSectionIdFromAudios < ActiveRecord::Migration
  def change
    remove_column :audios, :section_id, :integer
  end
end
