# frozen_string_literal: true

require 'basic_sales_tax/app'

RSpec.describe BasicSalesTax::App do

  let(:app) { described_class.new(path_to_input_file: path_to_input_file) }

  describe '#output' do
    context 'when input does not contain any imported products' do
      let(:path_to_input_file) { 'fixtures/input_1.txt' }
      let(:output) { File.open('fixtures/output_1.txt').read }

      it 'has correct output' do
        expect(app.output).to eq(output)
      end
    end

    context 'when input has only imported products' do
      let(:path_to_input_file) { 'fixtures/input_2.txt' }
      let(:output) { File.open('fixtures/output_2.txt').read }

      it 'has correct output' do
        expect(app.output).to eq(output)
      end
    end

    context 'when input contains imported products' do
      let(:path_to_input_file) { 'fixtures/input_3.txt' }
      let(:output) { File.open('fixtures/output_3.txt').read }

      it 'has correct output' do
        expect(app.output).to eq(output)
      end
    end
  end
end
