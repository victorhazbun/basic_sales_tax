module BasicSalesTax
  class RawItem

    class << self
      def list(lines)
        lines.map { |line| parse(line) }
      end

      private

      def parse(line)
        match = line.match(/(\d+) (.*) at (\d+\.\d{2})/)
        quantity = match[1].to_i
        name = match[2]
        price = match[3].to_s

        {
          quantity: quantity,
          name: name,
          price: price
        }
      end
    end
  end
end
