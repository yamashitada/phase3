class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  process resize_to_limit: [200, 200]
  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_limit: [50, 50]
  end
end
