module Elevenstreet
  module API
    class Response
      attr_reader :response
      def initialize(response)
        @response = response['ClientMessage']
      end

      def product_no
        response['productNo']
      end

      def success?
        code == 200
      end

      def message
        response['message']
      end

      def code
        response['resultCode'].to_i
      end

      def to_s
        response.to_s
      end
    end
  end
end
