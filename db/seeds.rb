# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
 
User.create!(email: "nicolas.genest@codeboxx.biz", password: "123456", password_confirmation: "123456", admin: true)
User.create!(email: "nadya.fortier@codeboxx.biz", password: "123456", password_confirmation: "123456", admin: true)
User.create!(email: "martin.chantal@codeboxx.biz", password: "123456", password_confirmation: "123456", admin: true)
User.create!(email: "mathieu.houde@codeboxx.biz", password: "123456", password_confirmation: "123456", admin: true)
User.create!(email: "david.boutin@codeboxx.biz", password: "123456", password_confirmation: "123456", admin: true)
User.create!(email: "mathieu.lortie@codeboxx.biz", password: "123456", password_confirmation: "123456", admin: true)
User.create!(email: "thomas.carrier@codeboxx.biz", password: "123456", password_confirmation: "123456", admin: true)


15.times do
    User.create!(

        email: Faker::Internet.email,
        password: '123456'
    )
end

    employee = Employee.create! :first_name => 'Nicolas', :last_name => 'Genest', :title => 'Comm.Rep', :email => 'nicolas.genest@codeboxx.biz', :password => '123456', :password_confirmation => '123456', :user_id => 1
    employee = Employee.create! :first_name => 'Nadya', :last_name => 'Fortier', :title => 'Director', :email => 'nadya.fortier@codeboxx.biz', :password => '123456', :password_confirmation => '123456', :user_id => 2
    employee = Employee.create! :first_name => 'Martin', :last_name => 'Chantal', :title => 'Director Assistant', :email => 'martin.chantal@codeboxx.biz', :password => '123456', :password_confirmation => '123456', :user_id => 3
    employee = Employee.create! :first_name => 'Mathieu', :last_name => 'Houde', :title => 'Captain', :email => 'mathieu.houde@codeboxx.biz', :password => '123456', :password_confirmation => '123456', :user_id => 4
    employee = Employee.create! :first_name => 'David', :last_name => 'Boutin', :title => 'Engineer', :email => 'david.boutin@codeboxx.biz', :password => '123456', :password_confirmation => '123456', :user_id => 5
    employee = Employee.create! :first_name => 'Mathieu', :last_name => 'Lortie', :title => 'Engineer', :email => 'mathieu.lortie@codeboxx.biz', :password => '123456', :password_confirmation => '123456', :user_id => 6
    employee = Employee.create! :first_name => 'Thomas', :last_name => 'Carrier', :title => 'Engineer', :email => 'thomas.carrier@codeboxx.biz', :password => '123456', :password_confirmation => '123456', :user_id => 7

50.times do
    Employee.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        title: Faker::Construction.role,
        email: Faker::Internet.email,
        password: '123456',
        created_at: Faker::Time.between(from: 4.years.ago, to: 7.months.ago),
        updated_at: Faker::Time.between(from: 6.months.ago, to: Time.now)
    )
end

1.times do
    Lead.create!(

        full_name: Faker::Name.name.delete("\'"),
        company_name: Faker::Company.name.delete("\'"),
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.cell_phone_in_e164,
        project_name: Faker::Company.industry,
        project_description: Faker::Company.type,
        department_in_charge: Faker::Commerce.department,
        message: Faker::Construction.subcontract_category,
        attached_file: Faker::File.unique.file_name,
        created_at: Faker::Time.between(from: 5.months.ago, to: Time.now),
        updated_at: Faker::Time.between(from: 2.weeks.ago, to: Time.now)
    )
end

    status_array = ["Active", "Active", "Active", "Inactive"]
    type_of_building_array = ["Residential", "Commercial", "Corporate", "Hybrid"]
    type_of_service_array = ["Standard", "Premium", "Excelium"]

require 'google_maps_service'
#gmaps = GoogleMapsService::Client.new(key: ENV["GOOGLEMAPS"])
 
#results = gmaps.geocode(row['address'])
   
data = File.read("db/addresses-us-100.json")
json= JSON.parse(data)
json["addresses"].each do |row|

  puts row.to_hash
    t = Address.new
    t.type_of_address = ['Billing', 'Shipping', 'Home', 'Business'].sample
    t.status = status_array.sample
    t.entity = ['Building', 'Customer'].sample 
    t.number_and_street = row['address1']
    t.appartment_or_suite = Faker::Address.secondary_address.delete("\'")
    t.city = row['city']
    t.state = row['state']
    t.zip_code = row['postalCode']
    t.country = "US"  
    t.notes = Faker::Types.rb_string  
    t.created_at = Faker::Time.between(from: 3.years.ago, to: 9.months.ago)
    t.updated_at = Faker::Time.between(from: 8.months.ago, to: Time.now)
    t.latitude = row['coordinates']['lat']
    t.longitude = row['coordinates']['lng']
    #t.latitude = results[0][:geometry][:location][:lat]
    #t.longitude = results[0][:geometry][:location][:lng]
    t.save!
    
end

    address_id_array = [*1..10]
    user_id_array = [*11..20]

10.times do
    Customer.create!(

        company_name: Faker::Company.name.delete("\'"),
        full_name: Faker::Name.name.delete("\'"),
        phone: Faker::PhoneNumber.cell_phone_in_e164,
        email: Faker::Internet.email,
        company_description: Faker::Company.type,
        tech_authority_full_name: Faker::Company.name.delete("\'"),
        tech_authority_phone: Faker::PhoneNumber.cell_phone_in_e164,
        tech_authority_email: Faker::Internet.email,
        address_id: address_id_array.delete(address_id_array.sample),
        user_id: user_id_array.delete(user_id_array.sample),
        created_at: Faker::Time.between(from: 3.years.ago, to: 7.months.ago),
        updated_at: Faker::Time.between(from: 6.months.ago, to: Time.now)
        

    )
end

    address_id_array = [*11..25]
    customer_id_array = [*1..10]

10.times do
    Building.create!(

        admin_full_name: Faker::Name.first_name.delete("\'"),
        admin_email: Faker::Internet.email,
        admin_phone: Faker::PhoneNumber.cell_phone_in_e164,
        tech_contact_full_name: Faker::Name.name.delete("\'"),
        tech_contact_email: Faker::Internet.email,
        tech_contact_phone: Faker::PhoneNumber.cell_phone_in_e164,
        customer_id: customer_id_array.delete(customer_id_array.sample),
        address_id: address_id_array.delete(address_id_array.sample),
        created_at: Faker::Time.between(from: 3.years.ago, to: 7.months.ago),
        updated_at: Faker::Time.between(from: 6.months.ago, to: Time.now)
    )
end

    building_id_array = [*1..15]
    address_id_array = [*1..5]
    customer_id_array = [*1..10]
5.times do
    Building.create!(

        admin_full_name: Faker::Name.first_name.delete("\'"),
        admin_email: Faker::Internet.email,
        admin_phone: Faker::PhoneNumber.cell_phone_in_e164,
        tech_contact_full_name: Faker::Name.name.delete("\'"),
        tech_contact_email: Faker::Internet.email,
        tech_contact_phone: Faker::PhoneNumber.cell_phone_in_e164,
        customer_id: customer_id_array.sample,
        address_id: address_id_array.delete(address_id_array.sample),
        created_at: Faker::Time.between(from: 3.years.ago, to: 7.months.ago),
        updated_at: Faker::Time.between(from: 6.months.ago, to: Time.now)
    )
end

    #building_id_array = [*1..5]

15.times do
    BuildingDetail.create!(

        key: Faker::Types.rb_string,
        value: Faker::Types.rb_string,
        building_id: building_id_array.delete(building_id_array.sample),
        created_at: Faker::Time.between(from: 3.years.ago, to: 7.months.ago),
        updated_at: Faker::Time.between(from: 6.months.ago, to: Time.now)
    )
end

    building_id_array = [*1..15]
    employee_id_array = [*11..52]

15.times do
    Battery.create!(

        type_of_battery: type_of_building_array.sample,
        status: status_array.sample,
        date_of_comissioning: Faker::Time.between(from: 3.years.ago, to: 7.months.ago),
        date_of_last_inspection: Faker::Time.between(from: 1.year.ago, to: 1.week.ago),
        certificate_of_operation: Faker::Code.isbn,
        information: Faker::Types.rb_string,
        notes: Faker::Types.rb_string,
        building_id: building_id_array.delete(building_id_array.sample),
        employee_id: employee_id_array.delete(employee_id_array.sample)
    )
end
    
    battery_id_array =[*1..15]
=begin
15.times do
    Column.create!(

        type_of_column: type_of_building_array.sample,
        number_of_floors: Faker::Number.number(2),
        status: status_array.sample,
        information: Faker::Types.rb_string,
        notes: Faker::Types.rb_string,
        battery_id: battery_id_array.delete(battery_id_array.sample)

    )
end

    column_id_array =[*1..15]
=end
60.times do
    Column.create!(

        type_of_column: type_of_building_array.sample,
        number_of_floors_served: Faker::Number.number(digits: 2),
        status: status_array.sample,
        information: Faker::Types.rb_string,
        notes: Faker::Types.rb_string,
        battery_id: battery_id_array.sample

    )
end

    column_id_array =[*1..60]
=begin
75.times do
    Elevator.create!(

        serial_number: Faker::Code.isbn,
        model: type_of_service_array.sample,
        type_of_building: type_of_building_array.sample,
        status: status_array.sample,
        date_of_commissioning: Faker::Time.between(from: 3.years.ago, to: 7.months.ago),
        date_of_last_inspection: Faker::Time.between(from: 1.year.ago, to: 1.week.ago),
        certificate_of_operations: Faker::Code.isbn,
        information: Faker::Types.rb_string,
        notes: Faker::Types.rb_string,
        column_id: column_id_array.delete(column_id_array.sample)
    )
end
    column_id_array =[*1..75]
=end
225.times do
    Elevator.create!(

        serial_number: Faker::Code.isbn,
        model: type_of_service_array.sample,
        type_of_building: type_of_building_array.sample,
        status: status_array.sample,
        date_of_commissioning: Faker::Time.between(from: 3.years.ago, to: 7.months.ago),
        date_of_last_inspection: Faker::Time.between(from: 1.year.ago, to: 1.week.ago),
        certificate_of_operations: Faker::Code.isbn,
        information: Faker::Types.rb_string,
        notes: Faker::Types.rb_string,
        column_id: column_id_array.sample
        
    )
end

1.times do
    Quote.create!(

        name: Faker::Name.name.delete("\'"),
        company: Faker::Company.name.delete("\'"),
        email: Faker::Internet.email,
        phone_number: Faker::PhoneNumber.cell_phone_in_e164,
        type_of_building: type_of_building_array.sample,
        number_of_appartments: Faker::Number.number(digits: 2),
        number_of_floors: Faker::Number.number(digits: 2),
        number_of_basements: Faker::Number.number(digits: 2),
        number_of_stores: Faker::Number.number(digits: 2),
        number_of_cages: Faker::Number.number(digits: 2),
        number_of_parking_spots: Faker::Number.number(digits: 2),
        number_of_companies: Faker::Number.number(digits: 2),
        occupants_per_floor: Faker::Number.number(digits: 2),
        open_hours: Faker::Number.number(digits: 2),
        estimate_number_of_cages: Faker::Number.number(digits: 2),
        range_of_elevator: type_of_service_array.sample,
        unit_price: Faker::Commerce.price(),
        elevator_price: Faker::Commerce.price(),
        installation_fees: Faker::Commerce.price(),
        total_price: Faker::Commerce.price(),
        created_at: Faker::Time.between(from: 6.months.ago, to: 2.weeks.ago),
        updated_at: Faker::Time.between(from: 2.weeks.ago, to: Time.now)
    )
end
