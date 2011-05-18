module Admin::OrderHelper
  def order_total(orders)
    begin 
      orders.inject(0){|sum, order| order.total + sum }
      rescue 
        return 0
    end 
  end
end
