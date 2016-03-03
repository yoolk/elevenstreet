module Elevenstreet
  module API
    module Category
      def categories
        response = self.class.get('/cateservice/category', headers: headers)

        response['categorys']
      end

      def sub_categories(parent_category_id)
        response = self.class.get("/cateservice/category/#{parent_category_id}", headers: headers)

        response['categorys']
      end
    end
  end
end
