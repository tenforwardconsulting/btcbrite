class NetworkController < ApplicationController
  def status
    @netinfo = {}
    [:bitcoin, :litecoin, :dogecoin].each do |network|
      client = Bitcoin::Client.local(network)
      begin
        @netinfo[network] = client.getinfo
      rescue Exception => ex
        @netinfo[network] = {"errors" => "Unable to connect to daemon (#{ex.message})"}
      end
    end
  end
end