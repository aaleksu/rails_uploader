RailsUploader.setup do |config|
  config.thumbs = ['100x100', '200x200']
  config.upload_dir = ''
  config.resizable_attributes = []
  config.images_extnames = %w['.jpg' '.jpeg' '.gif' '.png']
  config.images_types = %w['image/jpg' 'image/jpeg' 'image/gif' 'image/png']
  config.docs_extnames = %w[doc docx pdf xls xlsx odt]
  config.docs_types = %w[
    'application/*'
    'application/*'
    'application/*'
    'application/*'
    'application/*'
    'application/*']
end