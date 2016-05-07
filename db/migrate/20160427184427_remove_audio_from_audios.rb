class RemoveAudioFromAudios < ActiveRecord::Migration
  def change
    remove_column :audios, :audio, :binary
  end
end
