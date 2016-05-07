class AddSectionRefToAudios < ActiveRecord::Migration
  def change
    add_reference :audios, :section, index: true, foreign_key: true
  end
end
