class AddMusicToAudios < ActiveRecord::Migration
  def change
    add_column :audios, :music, :string
  end
end
