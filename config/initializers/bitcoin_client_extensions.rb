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
      network = network.to_sym
      return Bitcoin::Client.new(ENV["#{network.upcase}_USER"], ENV["#{network.upcase}_PASSWORD"],
        { :host => 'localhost', :port => Bitcoin::NETWORKS[network][:port], :ssl => false} )
    end
  end
end