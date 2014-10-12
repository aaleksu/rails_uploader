require 'RMagick'

module RailsUploader
  require 'rails_uploader/railtie' if defined?(Rails)

  @@thumbs = []
  mattr_accessor :thumbs

  @@upload_dir = nil
  mattr_accessor :upload_dir

  @@resizable_attributes = []
  mattr_accessor :resizable_attributes
  
  @@images_extnames = []
  mattr_accessor :images_extnames

  @@images_types = []
  mattr_accessor :images_types
  
  @@docs_extnames = []
  mattr_accessor :docs_extnames

  @@docs_types = []
  mattr_accessor :docs_types

  @current_attr = nil
  @target_dir = nil

  def self.setup
    yield self
  end

  def self.get_thumbs
    @@thumbs
  end

  def self.get_upload_dir
    @@upload_dir
  end

  def upload
    begin
      return if self.class.nil?
      
      model_name = self.class.name.downcase
      @target_dir = File.join(Rails.root, 'public', @@upload_dir, model_name)
    
      FileUtils.mkdir_p @target_dir unless File.exists? @target_dir
    
      self.uploadable_attributes.each do |attr|
        @current_attr = self.method(attr).call

        next if @current_attr.nil?

        file_unique_name = unique_name
        attr_path = File.join @target_dir, file_unique_name
        new_image = File.open(attr_path, 'wb') { |f| f.write(@current_attr.read)}

        self.send "#{attr}=", File.join(@@upload_dir, model_name, file_unique_name)

        make_thumbs if self.resizable_attributes.include? attr
      end
    rescue Exception => e
      raise Exception.new e
    end
  end

  private
  def make_thumbs
    source = Magick::Image.read(@current_attr.tempfile.path).first
    @@thumbs.each do |geometry|
      source.change_geometry(geometry) {|cols, rows, img|
        thumb = img.resize cols, rows
        unique_thumb_name = unique_name geometry
        thumb.write(File.join(@target_dir, unique_thumb_name))
      }
    end
  end

  def unique_name prefix = ''
    original_name = prefix.empty? ? @current_attr.original_filename : "#{prefix}_#{@current_attr.original_filename}"
    name = original_name
    i = 1
    while File.exists?(File.join(@target_dir, name)) do
      name = i.to_s + '_' + original_name
      i += 1
    end
    
    name
  end

  def dbg o
    p '='*40
    p o
    p '='*40
  end
end
