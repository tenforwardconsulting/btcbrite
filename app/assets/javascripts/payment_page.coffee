class BTCBrite.PaymentPage
  constructor: (network, account) ->
    @account = account
    @network = network
    @interval = setInterval @poll, 1000

  poll: =>
    $.ajax
      url: "/pay/#{@network}/status"
      type: 'post'
      data:
        account: @account
      dataType: 'json'
      success: (response) =>
        if response.confirmed
          $('.coupon').show()
          $('.code').html(response.coupon_code)
          clearInterval(@interval)