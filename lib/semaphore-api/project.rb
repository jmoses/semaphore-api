module Semaphore
  module Api
    class Project
      include HTTParty
      base_uri "https://semaphoreapp.com/"

      def self.hash_attribute(*names)
        Array(name).flatten.each do |name|
          define_method(name) do
            hash[name.to_s]
          end
        end
      end

      def self.all
        default_params auth_token: Semaphore::Api::Client.auth_token

        get("projects").each.map do |item|
          new(item)
        end
      end

      def self.perform_request(http_method, path, options, &block)
        path = path =~ /^\// ? path : "/api/v1/#{path}"

        super(http_method, path, options, &block)
      end

      attr_accessor :hash
      def initialize(hash)
        self.hash = hash
      end

      def status
        hash['branches'].map do |branch|
          {name: branch['branch_name'], status: branch['result']}
        end
      end

    end
  end
end


