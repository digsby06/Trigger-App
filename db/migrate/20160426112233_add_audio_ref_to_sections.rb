class AddAudioRefToSections < ActiveRecord::Migration
  def change
    add_reference :sections, :audio, index: true, foreign_key: true
  end
end
