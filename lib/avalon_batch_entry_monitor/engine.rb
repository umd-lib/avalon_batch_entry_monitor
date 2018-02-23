require 'blacklight'
require 'momentjs-rails'
require 'bootstrap3-datetimepicker-rails'
require 'kaminari'

module AvalonBatchEntryMonitor
  class Engine < ::Rails::Engine
    config.after_initialize do
      IngestBatchEntryJob.class_eval do
        around_perform do |job, block|
          preflight = AvalonBatchEntryMonitor::Hooks.before_perform(job.arguments.first)
          block.call if preflight
          AvalonBatchEntryMonitor::Hooks.after_perform(job.arguments.first)
        end
      end
    end
  end
end
