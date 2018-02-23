# -*- coding: utf-8 -*-
require File.join(File.dirname(__FILE__), 'lib/avalon_batch_entry_monitor/version')

Gem::Specification.new do |s|
  s.name     = 'avalon_batch_entry_monitor'
  s.version  = AvalonBatchEntryMonitor::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors  = ["Chris Fitzpatrick"]
  s.email    = ["cf1tz@umd.edu"]
  s.homepage = 'https://github.com/umd-lib/avalon_batch_entry_monitor.git'
  s.summary  = 'Monitor your batch entries'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.license = 'Apache 2.0'

  s.add_dependency 'rails', '>= 3.0'
  s.add_dependency 'jquery-rails' # our JS needs jquery_rails
  s.add_dependency 'blacklight', '>= 6.0.2'
  s.add_dependency 'momentjs-rails', '>= 2.9.0'
  s.add_dependency 'bootstrap3-datetimepicker-rails', '~> 4.14.30'

  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'solr_wrapper', '~> 0.14'
  s.add_development_dependency 'engine_cart', '~> 1.0'
end
