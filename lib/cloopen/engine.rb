module Cloopen

  if defined?(Rails)

    class Engine < Rails::Engine
  
      initializer "cloopen.load_app_instance_data" do |app|
        Cloopen.setup do |config|
          config.app_root = app.root
        end
      end
  
    end

  end

end
