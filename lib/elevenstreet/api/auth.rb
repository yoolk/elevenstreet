module Elevenstreet
  module API
    module Auth
      def is_authorized?
        !!categories
      end
    end
  end
end
