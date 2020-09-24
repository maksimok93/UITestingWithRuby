require "rake"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec) do |test|
  test.pattern = Dir.glob("spec/**/*_spec.rb")
  test.rspec_opts = "--format documentation"
end
task default: :spec