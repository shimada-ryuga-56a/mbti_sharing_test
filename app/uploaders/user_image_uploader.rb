class UserImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  # Only process images if they are present
  process :resize_to_fill => [300, 300, gravity = ::Magick::CenterGravity], if: :image_present?

  def image_present?(new_file)
    new_file && new_file.size > 0
  end

  def default_url(*args)
    ActionController::Base.helpers.asset_path("user_default.png")
  end

  def extension_allowlist
    %w[jpg jpeg gif png]
  end

  def filename
    if original_filename.present?
      "#{Time.now.strftime('%Y%m%d%H%M%S')}.jpg"
    end
  end
end
