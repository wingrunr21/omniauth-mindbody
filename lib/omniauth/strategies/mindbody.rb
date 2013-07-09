require 'omniauth'
require 'mindbody-api'

module OmniAuth
  module Strategies
    class MindBody
      include OmniAuth::Strategy

      option :fields, [:email, :password]

      def request_phase
        form = OmniAuth::Form.new(:title => "User Info", :url => callback_path)
        options.fields.each do |field|
          form.text_field field.to_s.capitalize.gsub("_", " "), field.to_s
        end
        form.button "Sign In"
        form.to_response
      end

      def callback_phase
        begin
          res = ::MindBody::Services::ClientService.validate_login(request.params['email'], request.params['password'])
          return fail!(:invalid_credentials) unless res.status == "Success"

          @raw_info ||= res.result
          super
        rescue Exception => e
          return fail!(:mindbody_error, e)
        end
      end

      uid { client.id.to_s }

      info do
        {
          :name => client.name,
          :first_name => client.first_name,
          :last_name => client.last_name,
          :email => client.email,
          :phone => client.home_phone || client.mobile_phone,
          :location => client.city.nil? ? "#{client.city}, #{client.state}" : client.state,
          :nickname => client.username,
          :image => client.photo_url
        }
      end

      credentials do
        {:guid => raw_info[:guid].to_s }
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        @raw_info
      end

      def client
        @client ||= raw_info[:client]
      end
    end
  end
end

OmniAuth.config.add_camelization('mindbody', 'MindBody')
