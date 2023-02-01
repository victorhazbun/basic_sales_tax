module BasicSalesTax
  class RawLine

    class << self
      def list(path_to_input_file)
        lines = []

        File.open(path_to_input_file, "r") do |file|
          file.each_line do |line|
            lines << line.strip
          end
        end

        lines
      end
    end
  end
end
