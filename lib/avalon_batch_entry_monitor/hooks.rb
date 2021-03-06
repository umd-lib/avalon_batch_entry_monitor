module AvalonBatchEntryMonitor
  class Hooks
    class << self
       def before_perform(batch_entry)
         if batch_entry.current_status.casecmp('canceled').zero?
           batch_entry.complete = true
           batch_entry.current_status = 'Dequeued'
           batch_entry.error_message = 'This batch entry was canceled by the user.'
           batch_entry.save
           false
         else
           true
         end
       end

       def after_perform(batch_entry); end
    end
  end
end
