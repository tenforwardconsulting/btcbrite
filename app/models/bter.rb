class Bter
  @@btc_usd = 800
  @@
  def price_in(currency)

  end


  def rates
    if @rates.nil
      response = HTTParty.get('http://data.bter.com/api/1/tickers')
    end
    rates

  end

end