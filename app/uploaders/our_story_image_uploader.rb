# app/uploaders/our_story_image_uploader.rb
class OurStoryImageUploader < CarrierWave::Uploader::Base
    include Cloudinary::CarrierWave
  end
  