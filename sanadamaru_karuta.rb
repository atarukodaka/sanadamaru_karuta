require 'rubygems'
require 'romkan'
require 'unf'
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
<h1>Sanadamaru Karuta</h1>

<table>
<% ar.sort_by{|hash| hash[:text] }.each do |hash| %>
  <tr>
    <td><span style="font-size: large; font-weight: bold;"><%= hash[:text][0].to_nfd.split('').first %></span>
    <td><a href="<%= hash[:img] %>"><img src="<%=  hash[:img] %>" width="200"></a>
    <td><%= hash[:text] %>
<% end %>
</table>

<hr>
Sanadamaru Karuta Builder

EOS

  erb = ERB.new(layout)
  puts erb.result(binding)
end

main
