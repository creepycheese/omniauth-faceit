require 'omniauth/strategies/oauth2'
module OmniAuth
  module Strategies
    class Faceit < OmniAuth::Strategies::OAuth2
      option :name, :face_it

      option :client_options, {
        :site => "https://api.faceit.com",
        :authorize_url =>"https://cdn.faceit.com/widgets/sso/index.html?response_type=code&redirect_popup=true",
        :token_url => "https://api.faceit.com/auth/v1/oauth/token",
        :auth_scheme => :basic_auth
      }

      uid { raw_info["id"] }

      info do
        {
          :email => raw_info["email"],
          :uid => raw_info
          # and anything else you want to return to your API consumers
        }
      end

      def raw_info
        @raw_info ||= access_token.get("https://api.faceit.com/auth/v1/resources/userinfo").parsed
      end

      # https://github.com/intridea/omniauth-oauth2/issues/81
      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
