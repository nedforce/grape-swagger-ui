module Grape
  module Swagger
    module Ui
      module Routes

        def self.draw(map)
          map.instance_exec do
            get "/api/swagger", :to => 'swagger#index', :as => 'api_swagger'
          end
        end

      end
    end
  end
end