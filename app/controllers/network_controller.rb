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

  def dice
    @iterations = 1_000_000

    @bins = {}
    @iterations.times do
      int = (Digest::SHA512.hexdigest(SecureRandom.hex)[0...8].to_i(16)/42949672.95).round
      @bins[int] ||= 0
      @bins[int] += 1
    end
  end

end