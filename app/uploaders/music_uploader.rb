# encoding: utf-8
class MusicUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:

  # include Rails.application.routes.url_helpers
  # Rails.application.routes.default_url_options = ActionMailer::Base.default_url_options
  
  def store_dir
    "#{Rails.root}/app/assets/audios/#{model.id}"
  end

  def cache_dir
    '/tmp/cache/audios'
  end

  uploader = MusicUploader.new

 

  def default_url
    ActionController::Base.helpers.asset_path("/audios/" + [version_name, "default.mp3"].compact.join('_'))
  end


  def extension_white_list
    %w(mp3)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
