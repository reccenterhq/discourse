# encoding: utf-8

class ThumbnailUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # 1. Main cropped (feature): 747 x 240
  # 2. Main uncropped (large): 747 x XXX
  # 3. Smaller main cropped (standard or medium): 373 x 210
  # 4. Square large (square): 677 x 677
  # 5. Square small (square-small): 340x340
  # 6. Small thumb square (thumbnail): 100 x 100

  version :feature do
    process resize_to_fill: [747, 420]
  end

  version :large do
    process resize_to_fit: [747, 2000]
  end

  version :medium do
    process resize_to_fill: [373, 210]
  end

  version :square do
    process resize_to_fill: [677, 677]
  end

  version :square_small do
    process resize_to_fill: [340, 340]
  end

  version :thumbnail do
    process resize_to_fill: [100, 100]
  end


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
  def extension_white_list
    ["jpg", "jpeg", "png", "gif", "tif", "tiff", "bmp", "svg", "webp"]
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
