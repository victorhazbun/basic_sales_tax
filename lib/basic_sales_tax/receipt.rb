module BasicSalesTax
  class Receipt

    class << self
      def print(items)
        output = ''
        output << print_items(items)
        output << print_totals(items)
        output
      end

      def print_items(items)
        output = ''
        items.each do |item|
          taxed_price_str = format_to_money_string(item.total_unit_price.to_f * item.quantity)
          output << "#{item.quantity} #{item.name}: #{taxed_price_str}\n"
        end
        output
      end

      def print_totals(items)
        total, sales_taxes_total = calculate_totals(items)
        output = ''
        output << print_sales_taxes_total(sales_taxes_total)
        output << print_total(total)
        output
      end

      def calculate_totals(items)
        total = BigDecimal('0')
        sales_taxes_total = BigDecimal('0')
        items.each do |item|
          total += item.total_unit_price.to_f * item.quantity
          sales_taxes_total += item.unit_sales_tax.to_f * item.quantity
        end
        [total, sales_taxes_total]
      end

      def print_sales_taxes_total(bd)
        st_total = format_to_money_string(bd.to_s('F'))
        "Sales Taxes: #{st_total}\n"
      end

      def print_total(bd)
        total = format_to_money_string(bd.to_s('F'))
        "Total: #{total}\n"
      end

      def format_to_money_string(str)
        sprintf("%.2f", str)
      end
    end
  end
end
