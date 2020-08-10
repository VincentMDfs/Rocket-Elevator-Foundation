class Lead < ApplicationRecord

    def file_link
        %{<a href="/fileLeads/#{self.id}">Download file</a>}.html_safe
      end

      rails_admin do
        configure :file_link do
            visible false # so it's not on new/edit 
        end
    
        list do
          field :file_link
          field :full_name
          field :company_name
          field :email
          field :phone
          field :project_name
          field :project_description
          field :department_in_charge
          field :message
        end
    
        show do
          field :file_link
          field :full_name
          field :company_name
          field :email
          field :phone
          field :project_name
          field :project_description
          field :department_in_charge
          field :message
        end
      end

      after_save :new_zendesk_lead_ticket

      def new_zendesk_lead_ticket
        ZendeskAPI::Ticket.create!($client, 
            :subject => "#{self.full_name} from #{self.company_name}", 
            :comment => { 
                :value => "The contact #{self.full_name} from company #{self.company_name} can be reached at email
                #{self.email} and at phone number #{self.phone}.  #{self.department_in_charge} has a project named #{self.project_name}
                wich would require contribution from Rocket Elevators.
                
                #{self.project_description}
                
                Attached Message:  #{self.message}

                The Contact uploaded an attachment "
            }, 
            :requester => { 
                "name": self.full_name, 
                "email": self.email 
            },
            :priority => "normal",
            :type => "question"
            )
        end
    
end
