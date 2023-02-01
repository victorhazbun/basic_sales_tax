require 'bigdecimal'

module BasicSalesTax
  class SalesTax
    BASIC_TAX = BigDecimal('0.1').freeze
    IMPORT_TAX = BigDecimal('0.05').freeze
    NO_TAX = BigDecimal('0').freeze

    attr_reader :item

    def initialize(item)
      @item = item
    end

    def unit_sales_tax
      round_tax(BigDecimal(item.price) * sales_tax_rate).to_s('F')
    end

    def total_unit_price
      (BigDecimal(item.price) + BigDecimal(unit_sales_tax)).to_s('F')
    end

    private

    def round_tax(tax)
      round_factor = BigDecimal('1') / BigDecimal('0.05')
      (tax * round_factor).ceil / round_factor
    end

    def sales_tax_rate
      basic_sales_tax_rate + import_duty_sales_tax_rate
    end

    def import_duty_sales_tax_rate
      item.require_import_tax? ? IMPORT_TAX : NO_TAX
    end

    def basic_sales_tax_rate
      item.require_basic_tax? ? BASIC_TAX : NO_TAX
    end
  end
end
