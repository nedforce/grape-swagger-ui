require "grape-swagger-ui/version"
require "grape-swagger-ui/routes"

module Grape
  module Swagger
    module Ui
      class Engine < ::Rails::Engine
        config.draw_swagger_routes = true

        initializer 'grape-swagger-ui.draw_routes' do |app|
          if config.draw_swagger_routes && (!$rails_rake_task || (ARGV[0] =~ /routes\Z/))
            app.routes.append{ Grape::Swagger::Ui::Routes.draw(self) }
          end
        end

      end
    end
  end
end
