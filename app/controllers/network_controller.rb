class NetworkController < ApplicationController
  def status
    @netinfo = {}
    [:bitcoin, :litecoin, :dogecoin].each do |network|
      client = Bitcion::Client.local(network)
      @netinfo[network] = client.getinfo rescue {"errors" => "Unable to connect to daemon"}
    end
  end
end