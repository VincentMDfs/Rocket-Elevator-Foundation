require 'ElevatorMedia'
require 'rspec'
require 'spec_helper'

describe 'ElevatorMedia' do
    describe 'getContent' do
        # uri = URI('https://quotes.rest/qod')
        # quote = Net::HTTP.get(uri)
        # htmlQuote = JSON.parse(quote)
        # it "should return a json" do
        #     expect(JSON.parse(quote)).to be_a(Hash)
        # end
        # it 'should contain correct fields' do
        #     puts JSON.parse(quote)
        #     expect(JSON.parse(quote)['contents']).to include('quotes')
        # end
        it 'should output html with the json' do
            boite = ElevatorMedia::Streamer.new
            expect(boite.getContent).to include("div")
        end
    end
end