require 'rmeetup'

module RMeetupAPI
  class RMeetAPIClass
    def rMeetupAPIFunction
    RMeetup::Client.api_key = "317a5b279356a4a414378551742403d"
    #results = RMeetup::Client.fetch(:events,{:topic => "movies"})
    return RMeetup::Client.fetch(:events,{:topic => "movies",:country => "ireland"})
    #puts "#{results}".to_s
    end
  end
end