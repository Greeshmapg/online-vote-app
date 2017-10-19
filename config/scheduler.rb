require 'rufus-scheduler'

scheduler = Rufus::Scheduler::singleton


scheduler.every '1s' do
 Rails.logger.info "hello, it's #{Time.now}"
end
