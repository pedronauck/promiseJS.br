# Change Compass configuration
compass_config do |config|
  config.output_style = :compact
end

set :markdown_engine, :redcarpet
set :markdown,
		:fenced_code_blocks => true,
		:smartypants => true,
		:lax_spacing => false,
		:space_after_headers => false

page "robots.txt", :layout => false

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

activate :livereload
activate :directory_indexes

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
end
