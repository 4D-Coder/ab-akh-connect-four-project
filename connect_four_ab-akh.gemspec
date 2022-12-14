Gem::Specification.new do |s|
	s.name = 'connect_four_ab-akh'
	s.version = '1.0.0'
	s.platform = Gem::Platform::RUBY
	s.summary = 'Connect Four - 1 or 2 players'
	s.authors = ['Adam Bailey','Antonio Hunt']
	s.files = Dir.glob("{lib, bin}/**/*")

	s.add_development_dependency 'rspec', '~> 3.7'
	s.executables = ['connect_four_ab-akh']
	s.require_path = 'lib'
end