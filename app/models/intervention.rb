class Intervention < ApplicationRecord
    after_save :new_zendesk_intervention_ticket

      def new_zendesk_intervention_ticket
        ZendeskAPI::Ticket.create!($client, 
            :subject => "New intervention request!", 
            :comment => { 
                :value => "New intervention created by employee ID: #{self.author},

                Customer ID: #{self.customer_id}
                Building ID: #{self.battery_id}
                Battery ID: #{self.battery_id}
                Column ID: #{self.column_id}
                Elevator ID: #{self.elevator_id}
                Assigned to employee ID: #{self.employee_id}
                Description: #{self.report}
"
            }, 
            :requester => { 
                "name": Employee.where(user_id: self.author).first.last_name,
                "email": Employee.where(user_id: self.author).first.email
            },
            :priority => "normal",
            :type => "problem"
            )
        end
end
