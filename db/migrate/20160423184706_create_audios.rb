class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.string :audio_filename
      t.binary :audio, :limit => 10.megabyte

      t.timestamps null: false
    end
  end
end
