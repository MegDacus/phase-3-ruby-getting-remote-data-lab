require 'open-uri'
require 'net/http'
require 'json'
require 'awesome_print'

class GetRequester
    attr_reader :url

    def initialize(url)
        @url = url
    end

    def get_response_body
        url = self.url
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def parse_json
        response_body = self.get_response_body
        JSON.parse(response_body)
    end
end
