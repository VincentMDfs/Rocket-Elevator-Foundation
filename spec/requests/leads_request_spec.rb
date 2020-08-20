require 'rails_helper'
require './app/controllers/main_controller.rb'

RSpec.describe "Leads", type: :controller do
        newLead = Lead.create(
            full_name: "FullName",
            company_name: "Codeboxx",
            email: "email@codeboxx.biz",
            phone: "5141230000",
            project_name: "My project",
            project_description: "Drink all the booze, hack all the things",
            department_in_charge: "Lost causes",
            message: "Hi I'd like to rule the world",)

        it 'should be a Lead' do
            expect(newLead).to be_a(Lead)
        end
        it 'should contain a full name' do
            expect(newLead.full_name).to include("FullName")
        end
end
