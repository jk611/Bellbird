namespace :db do
  desc "Make sure all alarms are uppercase"
  task :uppercase => :environment do
    alarms = Alarm.all

    alarms.each do |alarm|
      if !alarm.content.nil?
        alarm.update_attribute(:content, alarm.content.upcase )
      end
    end

  end
end