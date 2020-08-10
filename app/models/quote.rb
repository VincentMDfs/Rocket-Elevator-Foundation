class Quote < ApplicationRecord

    after_save :new_zendesk_quote_ticket

    def new_zendesk_quote_ticket
        ZendeskAPI::Ticket.create!($client, 
            :subject => "#{self.name} from #{self.name}", 
            :comment => { 
                :value => "The contact #{self.name} can be reached at email
                #{self.email} and at phone number #{self.phone_number}.
                
                Building type selected is #{self.type_of_building} with product line #{self.range_of_elevator}. 
                The number of suggested elevator is #{self.estimate_number_of_cages}.
                The total price is #{self.total_price}.
                
                Reference Quote number: #{self.id}."
            }, 
            :requester => { 
                "name": self.name, 
                "email": self.email 
            },
            :priority => "normal",
            :type => "task"
            )
        end
end