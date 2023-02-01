require_relative '../basic_sales_tax/taxable'

module BasicSalesTax
  class Item
    include Taxable
    attr_reader :quantity, :name, :price, :unit_sales_tax, :total_unit_price

    class << self
      def list(raw_items)
        raw_items.map { |raw_item| to_item(raw_item) }
      end

      def to_item(raw_item)
        Item.new(quantity: raw_item[:quantity], name: raw_item[:name], price: raw_item[:price])
      end
    end

    def initialize(quantity:, name:, price:)
      @quantity = quantity
      @name = name
      @price = price
      @unit_sales_tax = sales_tax.unit_sales_tax
      @total_unit_price = sales_tax.total_unit_price
    end

    private

    def sales_tax
      @sales_tax ||= SalesTax.new(self)
    end
  end
end
