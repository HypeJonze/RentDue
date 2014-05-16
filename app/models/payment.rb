class Payment < ActiveRecord::Base
  belongs_to :property

  response = process_purchase
  transactions.create!(:action => "purchase", :amount => 100, :response => response)
  cart.update_attribute(:purchased_at, Time.now) if response.success?
  response.success?

  def express_token=(token)
    self[:express_token] = token
    if new_record? && !token.blank?
      # you can dump details var if you need more info from buyer
      details = EXPRESS_GATEWAY.details_for(token)
      self.express_payer_id = details.payer_id
      self.first_name = details.params["first_name"]
      self.last_name = details.params["last_name"]
    end
  end
def process_purchase
    EXPRESS_GATEWAY.purchase(100, express_purchase_options)
end

   private
  def express_purchase_options
    {
      :ip => ip,
      :token => express_token,
      :payer_id => express_payer_id
    }
  end

end
