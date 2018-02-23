require 'rake'
require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
require 'engine_cart/rake_task'

EngineCart.fingerprint_proc = EngineCart.rails_fingerprint_proc

task default: :ci

desc "Run specs"
RSpec::Core::RakeTask.new

task ci: ['engine_cart:generate'] do
end

namespace :test do
end
