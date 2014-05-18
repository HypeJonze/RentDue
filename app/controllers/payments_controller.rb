class PaymentsController < ApplicationController

def new
  @user =User.find(params[:user_id])
  @properties = @user.properties.find(params[:property_id])
  @@amount= @properties.rent

  def self.amount
    @@amount
  end
end

def express_checkout

  

  response = EXPRESS_GATEWAY.setup_purchase( @@amount/100,
    ip: request.remote_ip,
    return_url: express_check_url,
    cancel_return_url: root_url,
    items: [{name: "Property payment", description: "Property description", quantity: "1", amount:  @@amount/100}]

  )
  redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
 
  
end

def express_check
  @payment = Payment.new(:express_token => params[:token])
  @payment.purchase(@@amount)
end
end

