module Elevenstreet
  module API
    module Order
      def order(order_number)
        response = self.class.get("/ordservices/complete/#{order_number}", headers: headers)

        response['orders']['order'] if response['orders']['order'].present?
      end

      def order_confirmation(order_number, order_sequence)
        response = self.class.get("/ordservices/reqpackaging/#{order_number}/#{order_sequence}", headers: headers)

        response
      end

      def orders_to_be_processed(start_time, end_time)
        start_time_string = start_time.strftime('%d%m%Y%H%M')
        end_time_string   = end_time.strftime('%d%m%Y%H%M')

        response = self.class.get("/ordservices/packaging/#{start_time_string}/#{end_time_string}", headers: headers)
        response
      end

      def order_process(send_date, delivery_method, shipping_number = 'null', courier_company = 'null', tracking_number = 'null')
        url = "/ordservices/reqdelivery/#{send_date.strftime('%d%m%Y%H%M')}/#{delivery_method}" +
              "/#{courier_company}/#{tracking_number}/#{shipping_number}"

        response = self.class.get(url, headers: headers)
      end

      def completed_payments(start_time, end_time)
        start_time_string = start_time.strftime('%d%m%Y%H%M')
        end_time_string   = end_time.strftime('%d%m%Y%H%M')
        response = self.class.get("/ordservices/complete/#{start_time_string}/#{end_time_string}", headers: headers)

        response['orders']['order'] if response['orders'].present?
      end

      def completed_orders(start_time, end_time)
        start_time_string = start_time.strftime('%d%m%Y%H%M')
        end_time_string   = end_time.strftime('%d%m%Y%H%M')
        response = self.class.get("/ordservices/dlvcompleted/#{start_time_string}/#{end_time_string}", headers: headers)

        response
      end

      def cancel_order(order_number, order_sequence, reason_type, reason)
        response = self.class.get("/claimservice/reqrejectorder/#{order_number}/#{order_sequence}/#{reason_type}/#{reason}", headers: headers)

        response
      end

    end
  end
end
