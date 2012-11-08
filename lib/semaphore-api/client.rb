require 'httparty'

module Semaphore
  module Api
    class Client
      class << self
        attr_accessor :auth_token
      end
    end
  end
end
