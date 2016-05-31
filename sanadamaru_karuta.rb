require 'rubygems'
require 'romkan'
require 'unf'
require 'erb'

class SanadamaruKaruta
  def initialize
    @img_dir = "images"
    @layout_dir = "layouts"
  end

  def read_cards
    cards = []
    files = Dir.glob(File.join(@img_dir, "*"))
    files.each do |path|
      basename = File.basename(path, ".*")
      text = basename.gsub("_", " ").to_kana
      cards << {img: path, text: text}
    end
    return cards
  end

  def run
    cards = read_cards()
    
    layout_filename = File.join(@layout_dir, "layout.erb")
    layout = File.read(layout_filename)
    erb = ERB.new(layout)
    puts erb.result(binding)
  end
end

################
karuta = SanadamaruKaruta.new
karuta.run
