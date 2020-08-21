require 'http'
module ElevatorMedia

    class Streamer
        def getContent
            uri = URI('https://quotes.rest/qod')
            quote = Net::HTTP.get(uri)
            htmlQuote = JSON.parse(quote)
            stringQuote = (htmlQuote['contents']['quotes'][0]['quote'])
            stringAuthor = (htmlQuote['contents']['quotes'][0]['author'])
            return "<div class='text-center'><h4>Quote of the day: #{stringQuote}</h4><h6>Author: #{stringAuthor}</h6></div>"
        end
    end
end

# getContent fetches a random quote

# Rspec should verify if it returns a json