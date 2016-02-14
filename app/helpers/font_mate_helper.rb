helpers do
  def font_select
    html = '<select name="font_name">'

    path  = APP_ROOT.join('vendor', 'fonts')
    fonts = Dir.entries(path).select {|f| !File.directory? f}

    fonts.each do |font|
      html += "<option value='#{font}'>#{font}</option>"
    end

    html += '</select>'
    html
  end
end
