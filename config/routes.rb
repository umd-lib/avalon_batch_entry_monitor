AvalonBatchEntryMonitor::Engine.routes.draw do
  get "/admin/batch_entries", to: "batch_entries#index"
  post "/admin/batch_entries/cancel", to: "batch_entries#cancel"
end
