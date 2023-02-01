# frozen_string_literal: true

require_relative 'lib/basic_sales_tax/version'

Gem::Specification.new do |spec|
  spec.name = 'basic_sales_tax'
  spec.version = BasicSalesTax::VERSION
  spec.authors = ['vhazbun']
  spec.email = ['vhazbun@getaroom.com']

  spec.summary = 'Basic sales tax calculator'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = 'https://github.com/victorhazbun/basic_sales_tax'
  spec.metadata['source_code_uri'] = 'https://github.com/victorhazbun/basic_sales_tax'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split('\x0').reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'byebug'
end
