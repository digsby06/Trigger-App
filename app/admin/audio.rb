ActiveAdmin.register Audio do

permit_params :audio_filename, :music

form(:html => { :multipart => true }) do |f|
   f.inputs "Upload Audio" do
    f.input :audio_filename
     # f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url(:thumb))
    f.input :music, :as => :file
   end
     f.actions
 end

end
