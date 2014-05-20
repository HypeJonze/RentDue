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
    
    response = EXPRESS_GATEWAY.setup_purchase( @@amount,
    ip: request.remote_ip,
    return_url: express_check_url,
    cancel_return_url: root_url,
    allow_guest_checkout: true,
    :header_background_color => 'ff0000',
    :address => {
                                                   :name => 'Ayhan',
                                                   :last_name => 'Basmisirli',
                                                   :address1 => '220 King St',
                                                   :city => 'Toronto',
                                                   :state => 'Ontario',
                                                   :county => 'CA',
                                                   :zip => 'M2J3G5',
                                                   :phone => '555-5555'
                                                 },
    items: [{name: "Property payment", description: "Property description", quantity: "1", amount:  @@amount}]

  )
  redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
 
  
end


def express_check
  @payment = Payment.new(:express_token => params[:token])
  @payment.purchase(@@amount)
end
end

