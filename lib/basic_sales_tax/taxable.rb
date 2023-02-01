module BasicSalesTax
  module Taxable
    def require_basic_tax?
      ['book', 'chocolate', 'pills'].none? { |s| name.downcase.include?(s) }
    end

    def require_import_tax?
      name =~ /imported/
    end
  end
end
