class PaymentsController < ApplicationController

  def express_checkout
  response = EXPRESS_GATEWAY.setup_purchase(100,
    ip: request.remote_ip,
    return_url: payments_url,
    cancel_return_url: root_url,
  
    items: [{name: "Property payment", description: "Property description", quantity: "1", amount: 100}]

  )
  redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
 end

def index
  @payment = Payment.new(:express_token => params[:token])
  @payment.purchase
end
  
  end

