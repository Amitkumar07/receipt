class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :state

  def self.sales_tax_amount(product_id, state_id, quantity)
    product=Product.find(product_id)
    tax=TaxRate.where(:category_id => product.category_id, :state_id => state_id ).first.amount
    sales_tax= ((quantity.to_i*product.price)/100)*tax
    sales_tax1=self.rounded_tax(sales_tax)
    if sales_tax1.nil?
      return sales_tax
    else
      return sales_tax1
    end
  end

  def self.total_price(product_id , quantity )
    price=Product.find(product_id).price
    price*quantity.to_i
  end

  def self.rounded_tax(sales_tax)
    fraction1=sales_tax.modulo(1).round(2)
    fraction=fraction1.modulo(0.1).round(2)
    if fraction <= 0.05 && fraction != 0.00
     s_tax=sales_tax+(0.05-fraction)
    elsif   fraction > 0.05 && fraction != 0.00
      s_tax=sales_tax+(0.10 - fraction)
    end
    return s_tax
  end
end
