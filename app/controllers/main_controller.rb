class MainController < ApplicationController

    require 'sendgrid-ruby'
    include SendGrid
    
def index
    
end
    
def banane
    
    Quote.create(
        name: params[:name1],
        email: params[:email1],
        phone_number: params[:phone1],
        type_of_building: params[:type_of],
        number_of_appartments: params[:app],
        number_of_floors: params[:floors],
        number_of_basements: params[:basements], 
        number_of_stores: params[:businesses], 
        number_of_cages: params[:cages], 
        number_of_parking_spots: params[:parking], 
        number_of_companies: params[:tenants], 
        occupants_per_floor: params[:occupants], 
        open_hours: params[:hours], 
        estimate_number_of_cages: params[:totalElevators], 
        range_of_elevator: params[:typeOfService], 
        unit_price: params[:unitCost],
        elevator_price: params[:subtotal],
        installation_fees: params[:installation],
        total_price: params[:grandtotal])

    
end
#Workaround added for empty attachment error
    def contactToLead
        if !params[:attachment].nil?
        Lead.create(
            full_name: params[:contact][:name],
            company_name: params[:contact][:company_name],
            email: params[:contact][:email],
            phone: params[:contact][:phone],
            project_name: params[:contact][:project_name],
            project_description: params[:contact][:description],
            department_in_charge: params[:contact][:department],
            message: params[:contact][:message],
            file_name: params[:attachment].original_filename,
            attached_file: params[:attachment].read
            )
        else 

            Lead.create(
            full_name: params[:contact][:name],
            company_name: params[:contact][:company_name],
            email: params[:contact][:email],
            phone: params[:contact][:phone],
            project_name: params[:contact][:project_name],
            project_description: params[:contact][:description],
            department_in_charge: params[:contact][:department],
            message: params[:contact][:message]
            )
        end
# Sendgrid (finally) in a working state
            from = SendGrid::Email.new(email: 'codeboxxvincentmd@gmail.com')
            to = SendGrid::Email.new(email: params[:contact][:email])
            subject = 'Contact form success'
            content = Content.new(type: 'text/html', value: '<html><body><a href="https://relevator.xyz" title="Rocket Elevators"><img src="https://relevator.xyz'+ActionController::Base.helpers.image_url('R2small.png')+'" alt="Rocket logo" /></a><br /><br /><h3 style="color:red;">Greetings '+params[:contact][:name]+'</h3><br /><p style="color:red;">We thank you for contacting Rocket Elevators to discuss the opportunity to contribute to your project '+params[:contact][:project_name]+'. <br /><br /> A representative from our team will be in touch with you very soon. We look forward to demonstrate the value of our solutions and help you choose the appropriate product given your requirements.<br /></p>
            <h5 style="color:blue;">We’ll Talk soon</h5><br />
            <h3 style="color:red;">The Rocket Team</h3></body>
            </html>')

            mail = SendGrid::Mail.new(from, subject, to, content)
            sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
            response = sg.client.mail._('send').post(request_body: mail.to_json)
            puts response.status_code
            puts response.body
            puts response.headers
            
            redirect_to '/main/index', notice: "Message sent successfully"

    end
    def download
        lead = Lead.where(:id => params[:id]).first
        send_data lead.attached_file, filename: lead.file_name
       end

end