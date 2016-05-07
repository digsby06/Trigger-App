require 'carrierwave/orm/activerecord'

class Audio < ActiveRecord::Base

has_many :sections

mount_uploader :music, MusicUploader

accepts_nested_attributes_for :sections, :allow_destroy => true


def audio_params
	params.require(:audio).permit(:music, :audio_filename, :file, :remote_music_url)
end


end
