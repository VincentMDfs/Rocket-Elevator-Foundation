# Rocket_Elevators_Information_Systems - CodeBoxx Week 4
We converted the static site from the Genesis program to a Ruby on Rails app based on the MVC model. The site has a MYSQL database and makes use of user authorization to manage permissions for accessing the information.

**Here is the url for the site:** https://relevator.xyz/

## Thanks to https://github.com/Modbeat/ and collaborators for weeks 1 to 5

## Week 7 authors: Vincent, Thomas and Philippe
- https://github.com/VincentMDfs
- https://github.com/ThomSimoneau
- https://github.com/plemire

## Test Users
The **password** for all users listed below is **123456**

**Admin user:**
- thomas.carrier@codeboxx.biz
- nicolas.genest@codeboxx.biz
- nadya.fortier@codeboxx.biz
- martin.chantal@codeboxx.biz
- mathieu.houde@codeboxx.biz
- david.boutin@codeboxx.biz
- mathieu.lortie@codeboxx.biz

**Regular user:**
- regularuser@codeboxx.biz

## Important Gems Used
- **faker** -- to seed the user and employees database with random names
- **cancancan** -- not implemented, to manage user authorization
- **devise** -- manage the user logins and more
- **rails__admin** -- adding an admin panel for employees at /admin (requires admin account)
- **blazer** -- a graphics and statistics added to the admin section
- **pg** -- the postgresql management plugin

## More on site functionality

### Week 4
- A quotes form was connected to the mysql database table to keep track of submitted forms
- Fake seeds were added to make the database more realistic
- Another table was created for users and employee accounts
- Devise was installed and configured to create/delete user sessions and user accounts
- Buttons were added depending on admin boolean and session status in the main navbar
- Fields were added to the quote form for additionnal information
- A backOffice was implemented to manage quotes or users and it is restricted to admins only at /admin

### Week 5
- The contact form is now connected to a mysql table and a redirect, notice and image link were added
- Many tables were added to the mysql schema to fit the query demands
- A new postgresql gem called "pg" was installed and a database was implemented to answer the queries
- The blazer gem was also installed and configured to reflect graphs based on the queries locked to admins
- A 404 page was added and redirects are now fully functionnal

## Configuration Files
- The rails_admin configuration can be done in config/initializers/rails_admin.rb
- The headers and footers are located in views/shared while the main folder holds the pages content.
- You will find the cancancan configs in /models/abiliy.rb
- In lib/tasks you will find the ruby files that populate the postgres (DWH) database


### Week 7 - API

## Dropbox API integration  
Integration in app/models/customer.rb  
Account: rocketelevators@lemire.dev / codeboxx1!

To archive the file from a lead (contact-us form), you need to login as an employee and then from the dashboard create a new user with the same e-mail address as the lead.  The file will be transfered in Dropbox in the folder Philippe Lemire/Application/rocketElevators2 in a subfolder with the company name.  You need to select "All files" to see the Philippe Lemire folder.


## Slack API integration  
Integration in app/models/elevator.rb  
Account: rocketelevators@lemire.dev

To generate a message in the #elevator_operations channel, you need to login as an employee and then from the dashboard, edit one of the existing elevator and change the status.  Ex.: From Active to Intervention


## ZenDesk API integration  
Integration in app/models/lead.rb and app/models/quote.rb  
Account: lemire.zendesk.com, philippe@lemire.dev / codeboxx1!

To generate a lead ticket, you need to fill and submit the contact-us on the page https://relevator.xyz/main/index#contact .
To generate a quote ticket, you need to fill and submit a quote on the page https://relevator.xyz/main/quote .

## SendGrid API integration
Integration in /app/controllers/main_controller

To generate a "thank you for contacting us" email with the colors and logo of rocket elevators. To generate, fill out a contact form on https://relevator.xyz .

## Watson API integration
Integration in /lib/rails_admin.rb
Audio configs in /app/views/rails_admin/main/dashboard.html.erb
Audio file in /app/assets/audios/watson.mp3

Connects to the IBM text-to-speech API and translates text and data into an audio file (watson.mp3)
To hear watson, make sure audio is allowed in your browser settings and click on the red button in the /admin (backoffice) page

## Twilio API integration
Integration in /app/models/elevator.rb
Configs in /lib/tasks/send_sms.rb

Generates text messages on change of elevator status to "Intervention"

## Google Maps API integration
Integration in /app/views/rails_admin/main/dashboard.html.erb

Embeds a map with the buildings of the clients and clickable pop-up windows for additionnal information

## Weather API integration
Integration in /app/views/rails_admin/main/dashboard.html.erb

Adds weather information to the maps pop-up window

## All API KEYS ARE STORED SERVER SIDE ONLY
### Please be reasonnable with your api calls as most of the accounts are a trial version!
