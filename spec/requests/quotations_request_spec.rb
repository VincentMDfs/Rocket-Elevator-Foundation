require 'rails_helper'
require './app/controllers/main_controller.rb'

RSpec.describe "Quotations", type: :controller do
        quotation = Quote.create(
            name: "name1",
            email: "email@codeboxx.biz",
            phone_number: "5149001234",
            type_of_building: "commercial",
            number_of_appartments: 10,
            number_of_floors: 2,
            number_of_basements: 1, 
            number_of_stores: 0, 
            number_of_cages: 0, 
            number_of_parking_spots: 0, 
            number_of_companies: 0, 
            occupants_per_floor: 10, 
            open_hours: 24, 
            estimate_number_of_cages: 5, 
            range_of_elevator: "1972", 
            unit_price: "13264",
            elevator_price: "21384",
            installation_fees: "3213",
            total_price: "1238764")

        it 'should be a quote' do
            expect(quotation).to be_a(Quote)
        end
        it 'should contain a name' do
            expect(quotation.name).to include("name1")
        end
    end
