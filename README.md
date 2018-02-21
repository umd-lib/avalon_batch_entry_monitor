Avalon Batch Entry Monitor 

# Description

Adds a UI to view ( and possibly cancel ) Batch Entries in Avalon.


# Installation


Add

    gem 'avalon_batch_entry_monitor', git: 'https://github.com/umd-lib/avalon_batch_entry_monitor.git'

to your Gemfile. Run "bundle install". 

Then add the following changes to your Avalon app:

Add the plugin JS to your manifest ( i.e. app/assets/javascripts/application.js):

    //= require avalon_batch_entry_monitor

and the plugin CSS to your manifest ( i.e. app/assets/stylesheets/application.scss):

    @import 'avalon_batch_entry_monitor';


Then mount the engine in your config/routes.rb:

    mount AvalonBatchEntryMonitor::Engine, at: '/'


# Usage

Go to /admin/batch_entries in your application to view your BatchEntries jobs.

Jobs that are not running ( and have not run ) can be canceled. Any job that
has a current_status of Queued can be removed from the queue by selecting them
in the UI and selecting "Cancel". This will flag the job to be not run during a
pre-perform step. 


