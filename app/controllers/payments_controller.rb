class PaymentsController < ApplicationController

  def express_checkout
  response = EXPRESS_GATEWAY.setup_purchase(100,
    ip: request.remote_ip,
    return_url: root_url,
    cancel_return_url: users_url,
  
    items: [{name: "Order", description: "Order description", quantity: "1", amount: 100}]

  )
  redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end
  def new
    @payment = Payment.new(:express_token => params[:token])
  end
  
end
