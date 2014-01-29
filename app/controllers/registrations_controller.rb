class RegistrationsController < ApplicationController
  def new

  end

  def pay
    @price = price params[:network]
    account = params[:account]
    if (account.blank?)
      params[:account] = SecureRandom.hex
      redirect_to params and return
    end
    client = Bitcoin::Client.local(params[:network])

    existing = client.getaddressesbyaccount(account)
    if (existing.size > 0)
      @address = existing.first
    else
      @address = client.getnewaddress(account)
    end

  end

  def payment_status
    account = params[:account]
    client = Bitcoin::Client.local(params[:network])
    total = client.getreceivedbyaccount(account, 0)
    if total >= price(params[:network])
      transactions = client.listtransactions(account)
      txid = transactions.first['txid']
      code = txid[0..6]
      EventBrite.new.ensure_coupon_code(code)
      render json: {confirmed: true, txid: txid, coupon_code: code}
    else
      render json: {confirmed: false}
    end
  end

  private

  def price(network)
    case network.to_sym
    when :bitcoin then 0.006
    when :litecoin then 0.24
    when :dogecoin then 3500
    end
  end

end