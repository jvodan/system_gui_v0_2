module EnginesSystemCore
  class CoreSystem
    module DomainNames

      def list_domains
        get 'system/domains/', parse: :json
      end

      def load_domain(params)
        get "system/domains/#{params[:domain_name]}", parse: :json
      end

      def update_domain(params)
        post "system/domains/#{params[:domain_name]}", params, parse: :json
      end

      def add_domain(params)
        post 'system/domains/domain_name', params, parse: :json
      end

      def remove_domain(params)
        delete "system/domains/#{params[:domain_name]}", parse: :boolean
      end

    end
  end
end
