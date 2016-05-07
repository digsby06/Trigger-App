ActiveAdmin.register Section do

permit_params :position, :event, :description, :audio_id, audio_attributes: [:music, :audio_filename, :_destroy]

	index do 
		selectable_column
		id_column
		column :position
		column :event
		column :description
		column :audio_id
	end

	filter :position
	filter :event

	form(:html => { :multipart => true }) do |f|
		f.inputs "Event Details" do
			f.input :position, :as => :select, :collection => (1..10).map
			f.input :event, :as => :select, :collection => Section.events
			f.input :description
    		f.input :audio_id, :as => :select, :collection => Section.songs, :member_label => (:audio_filename)
		end
		f.actions
	end 
  

end
