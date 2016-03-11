module Elevenstreet
  module API
    module Product
      def product(product_number)
        response = self.class.get("/prodservices/product/details/#{product_number}", headers: headers)

        response['Product']
      end

      def upsert_product(params)
        response = self.class.post('/prodservices/product', body: params.to_xml(root: 'Product', skip_types: true), headers: headers)

        response['ClientMessage']
      end

      def update_product_options(product_number, params)
        response = self.class.post("/prodservices/updateProductOption/#{product_number}", body: params.to_xml(root: 'Product', skip_types: true), headers: headers)

        response['Product']
      end

      def hide_product(product_number)
        response = self.class.put("/prodstatservice/stat/stopdisplay/#{product_number}", headers: headers)

        response['ClientMessage']
      end

      def unhide_product(product_number)
        response = self.class.put("/prodstatservice/stat/restartdisplay/#{product_number}", headers: headers)

        response['ClientMessage']
      end

      def update_product_price(product_number, price)
        response = self.class.get("/prodservices/product/price/#{product_number}/#{price}", headers: headers)

        response['ClientMessage']
      end

      def product_stocks(product_number)
        response = self.class.get("/prodmarketservice/prodmarket/stck/#{product_number}", headers: headers)

        response['ProductStocks']['ProductStock'] if response['ProductStocks'].present?
      end
    end
  end
end
