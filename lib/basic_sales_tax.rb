# frozen_string_literal: true

require_relative "basic_sales_tax/version"
require_relative "basic_sales_tax/raw_line"
require_relative "basic_sales_tax/raw_item"
require_relative "basic_sales_tax/item"
require_relative "basic_sales_tax/sales_tax"
require_relative "basic_sales_tax/receipt"

module BasicSalesTax
  class Error < StandardError; end
end
