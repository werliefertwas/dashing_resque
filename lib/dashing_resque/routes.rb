get '/views/:widget?.html' do
  widget = params[:widget]
  tilt_html_engines.each do |suffix, engines|
    file_name = "#{widget}.#{suffix}"
    file_override_path = File.join(settings.root, 'widgets', widget, file_name)
    return engines.first.new(file_override_path).render if File.exist?(file_override_path)

    file_path = File.join(File.dirname(__FILE__), 'assets', 'widgets', widget, file_name)
    return engines.first.new(file_path).render if File.exist?(file_path)
  end
end
