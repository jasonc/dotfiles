require 'irb/ext/save-history'
require 'active_support/core_ext/array'
require 'irb/completion'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

def hist
  puts Readline::HISTORY.entries.split("exit").last[0..-2].join("\n") 
end

