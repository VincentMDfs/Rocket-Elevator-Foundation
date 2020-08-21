require 'rails_helper'
require './app/controllers/main_controller.rb'

RSpec.describe "Interventions", type: :controller do
        newIntervention = Intervention.create(
            author: 2,
            customer_id: 2,
            building_id: 3,
            battery_id: 4,
            column_id: 5,
            report: 6,
            employee_id: 7,
            elevator_id: 8)

        it 'should be an Intervention' do
            expect(newIntervention).to be_an(Intervention)
        end
        it 'should contain the author id' do
            expect(newIntervention).to have_attributes(:author => (a_value > 0))
        end
end
