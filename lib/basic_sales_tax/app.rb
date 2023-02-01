module BasicSalesTax
  class App
    attr_reader :items

    def initialize(path_to_input_file:)
      @items = Item.list(RawItem.list(RawLine.list(path_to_input_file)))
    end

    def output
      Receipt.print(items)
    end
  end
end
