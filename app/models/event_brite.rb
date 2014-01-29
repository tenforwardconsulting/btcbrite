class EventBrite
  def ensure_coupon_code(code)
    create_coupon_code(code) unless get_coupon_codes.include?(code)
  end
  def create_coupon_code(code)
    params = base_params.merge({
      code: code,
      percent_off: 100,
      quantity_available: 1
    })
    response = HTTParty.get('https://www.eventbrite.com/json/discount_new', query: params)
  end
  def get_coupon_codes
    response = HTTParty.get('https://www.eventbrite.com/json/event_list_discounts', query: base_params)
    response['discounts'].collect{|d| d['discount']['code']}
  end

  def base_params
    {
      app_key: ENV["EVENTBRITE_APP_KEY"],
      user_key: ENV["EVENTBRITE_USER_KEY"],
      event_id: ENV["EVENTBRITE_EVENT_ID"]
    }
  end

end