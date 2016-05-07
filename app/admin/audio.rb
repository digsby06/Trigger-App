ActiveAdmin.register Audio do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


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
