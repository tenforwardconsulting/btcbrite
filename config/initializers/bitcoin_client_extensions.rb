module Bitcoin
  NETWORKS = {
    bitcoin: {
      port: 8332
    },
    dogecoin: {
      port: 22555
    },
    litecoin: {
      port: 9332
    }
  }

  class Client
    def self.local(network)
      return Bitcoin::Client.new(ENV["#{network.upcase}_USER"], ENV["#{network.upcase}_PASSWORD"],
        { :host => 'localhost', :port => Bitcoin::NETWORKS[network.to_sym][:port], :ssl => false} )
    end
  end
end