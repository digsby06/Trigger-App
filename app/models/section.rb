class Section < ActiveRecord::Base
belongs_to :audio

	EVENTS = %w(Thermostat Water Home\ Security Light Outdoor\ Camera Door\ Lock )
  	validates :event, inclusion: { in: EVENTS}

  	SONGS = Audio.all

  	accepts_nested_attributes_for :audio, :allow_destroy => true

  	def self.songs
  		SONGS
  	end

	def self.events
		EVENTS
	end

	def self.main_section
		where('position = 1').first
	end

	def self.second_section
		where('position > 1').order('position ASC').limit(2)
	end

	def self.third_section
		where('position > 3').order('position ASC').limit(3)
	end

	def section_params
	params.require(:section).permit(:event, :description, :position, :audio_id)
	end
end
