class NetworkController < ApplicationController
  def status
    @netinfo = {}
    [:bitcoin, :litecoin, :dogecoin].each do |network|
      client = Bitcoin::Client.new(ENV["#{network.upcase}_USER"], ENV["#{network.upcase}_PASSWORD"], :host => 'localhost', :port => 22555, :ssl => false)
      @netinfo[network] = client.getinfo rescue {"errors" => "Unable to connect to daemon"}
    end
  end
end