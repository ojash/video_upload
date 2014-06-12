# encoding: utf-8

class VideoUploader < CarrierWave::Uploader::Base

  include CarrierWave::Video
  include CarrierWave::Video::Thumbnailer
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process encode_video: [:mp4,:custom => '-acodec copy -vcodec copy' ]
  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  version :p480 do
    process encode_video: [:mp4,:custom => '-vcodec libx264 -vf scale="\'ceil(iw/ih*480/2)\'*2:480" -acodec copy' ]
    def full_filename(for_file)
      "#{File.basename(for_file, File.extname(for_file))}_480p.mp4"
    end
  end
 
  version :p720 do
    process encode_video: [:mp4,:custom => '-vcodec libx264 -vf scale="\'ceil(iw/ih*720/2)\'*2:720" -acodec copy' ]
    def full_filename(for_file)
      "#{File.basename(for_file, File.extname(for_file))}_720p.mp4"
    end
  end

  version :thumb do
    process thumbnail: [{format: 'png', quality: 10, size: 192, strip: true, logger: Rails.logger}]
    def full_filename for_file
      png_name for_file, version_name
    end
  end

  def png_name for_file, version_name
    %Q{#{version_name}_#{for_file.chomp(File.extname(for_file))}.png}
  end

  # process encode_video: [:mp4]

  # version :standard do
  #   process encode_video: [ :mp4, { resolution: "1280x720" }, { preserve_aspect_ratio: :height } ]
  # end

  # version :low do
  #   process encode_video: [ :mp4, {resolution: "640x480"}, {preserve_aspect_ratio: :height} ]
  # end

end
