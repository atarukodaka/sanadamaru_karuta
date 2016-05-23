require 'rubygems'
require 'romkan'
require 'unf'
require 'erb'

class SanadamaruKaruta
  def initialize
    @img_dir = "images"
    @layout_dir = "layouts"

    @layout = ""
  end

  def read_images
    ar = []
    files = Dir.glob(File.join(@img_dir, "*"))
    files.each do |path|
      basename = File.basename(path, ".*")
      text = basename.gsub("_", " ").to_kana
      ar << {img: path, text: text}
    end
    return ar
  end

  def run
    ar = read_images()

    layout_filename = File.join(@layout_dir, "layout.erb")
    layout = File.read(layout_filename)
    erb = ERB.new(layout)
    puts erb.result(binding)
  end
end

################
karuta = SanadamaruKaruta.new
karuta.run
