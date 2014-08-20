require 'rails/generators'
class CloopenGenerator < Rails::Generators::Base

  source_root File.expand_path('../templates', __FILE__)

  def install
    template "cloopen_setup.rb", "config/initializers/cloopen_setup.rb"
  end

end
