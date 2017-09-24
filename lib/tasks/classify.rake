task classify: :environment do
  require 'rmagick'
  include Magick
  client = TfFacenetClient.new 
  image = ImageList.new("tmp/aligned_images/sample/sample.png").export_pixels
  p image[0..4]
  client.query([image])
end
