class Customer < ApplicationRecord
  belongs_to :address, optional: true
  belongs_to :user, optional:true
  has_many :buildings

  #On new customer creation, execute archive_lead_attached_files  function
  after_create :archive_lead_attached_files
  
    def archive_lead_attached_files
    #The API key is defined in config/applications.yml
    client = DropboxApi::Client.new
    
    #Try to match the e-mail of the new customer with existing leads with the same e-mail
    leads = Lead.where(email: self.email)

      #Create a folder in Dropbox with the company name
        leads.each do |l|
          begin
            client.get_metadata("/#{l.company_name}") 
          rescue => exception
            client.create_folder("/#{l.company_name}")
          end
          #Transfer the binary file from the lead table to Dropbox
          if l.attached_file != nil
            begin
              client.get_metadata("/#{l.company_name}/#{l.file_name}") 
            rescue => exception
              client.upload_by_chunks("/#{l.company_name}/#{l.file_name}",l.attached_file)
          end
          #Remove the attached file from lead table after success transfert to dropbox
          removed = ""
          l.update_attribute(:file_name, removed)
          l.update_attribute(:attached_file, removed)
      end
    end
  end
end