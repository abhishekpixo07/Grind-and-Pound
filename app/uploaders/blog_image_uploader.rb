# app/uploaders/blog_image_uploader.rb
class BlogImageUploader < CarrierWave::Uploader::Base
    include Cloudinary::CarrierWave
  end
  