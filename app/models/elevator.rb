require './lib/tasks/send_sms.rb'
require 'slack-ruby-client'
require 'date'

class Elevator < ApplicationRecord
  belongs_to :column, optional: true
  after_update :send_sms
  before_update :slack_message

  def send_sms()
    status = self.status
    if status.downcase == 'intervention'
      sms = Messenger::SMS.new
      sms.send_sms
    end
  end

    # Send message to the slack channel
    def slack_message
      timestamp = DateTime.now.strftime("%d-%m-%Y %H:%M")
      e = Elevator.find(self.id)
      text = "The Elevator #{self.id} with Serial Number #{self.serial_number} changed status from #{self.status_was} to #{self.status} at #{timestamp}."
      Slack.configure do |config|
          config.token = ENV['SLACK_ACCESS_TOKEN']
      end
      client = Slack::Web::Client.new
      client.chat_postMessage(channel: '#elevator_operations', text: text, as_user: true)
  end
end


