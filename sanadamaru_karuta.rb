require 'rubygems'
require 'romkan'
require 'erb'

def main
  img_dir = "images"

  ar = []
  files = Dir.glob(File.join(img_dir, "*"))
  files.each do |path|
    basename = File.basename(path, ".*")
    text = basename.gsub("_", " ").to_kana
    ar << {img: path, text: text}
  end

  ###
  layout = <<EOS
<h1>sanadamaru karuta</h1>

<table>
<% ar.sort_by{|hash| hash[:text] }.each do |hash| %>
  <tr>
    <td><img src="<%=  hash[:img] %>" width=200>
    <td><%= hash[:text] %>
<% end %>
</table>
EOS

  erb = ERB.new(layout)
  puts erb.result(binding)
end

main



