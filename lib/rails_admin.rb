module RailsAdmin
  module Config
    module Actions
      class Dashboard < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
	
	require "ibm_watson/authenticators"
	require "ibm_watson/text_to_speech_v1"
	include IBMWatson
        register_instance_option :root? do
          true
        end

        register_instance_option :breadcrumb_parent do
          nil
        end

        register_instance_option :controller do
          proc do

		    authenticator = Authenticators::IamAuthenticator.new(
		    apikey: ENV["WATSON_API_KEY"]
		    )

		    text_to_speech = IBMWatson::TextToSpeechV1.new(
        authenticator: authenticator
        )

		    text_to_speech.service_url = "https://api.us-south.text-to-speech.watson.cloud.ibm.com/instances/12d9b61d-9be4-470f-bddd-679234cb7035"
        employee = Employee.find_by(user_id: current_user.id)
        File.open("app/assets/audios/watson.mp3", "wb") do |audio_file|
          response = text_to_speech.synthesize(
          text: "Good day",
          accept: "audio/mp3",
          voice: "en-GB_JamesV3Voice"
          ).result

        audio_file.write(response)
        
        end
            render @action.template_name, status: 200
          end
        end

        register_instance_option :route_fragment do
          ''
        end

        register_instance_option :link_icon do
          'icon-home'
        end

        register_instance_option :statistics? do
          true
        end
      end
    end
  end
end