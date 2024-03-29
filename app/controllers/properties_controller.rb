class PropertiesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index

    @user =User.find(params[:user_id])
    @properties = @user.properties
    
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
  end

def new
    @user =User.find(params[:user_id])
    @property = @user.properties.new

end

  
  def edit
    @user =User.find(params[:user_id])
    @property =@user.properties.find(params[:id])

  end

 
  def create
    @user =User.find(params[:user_id])
    @property = @user.properties.new(property_params)
 
    respond_to do |format|
       if @property.save
        
         format.html { redirect_to user_properties_path, notice: 'Property was successfully created.' }
          format.json { render :show, status: :created, location: @property }
      else
         format.html { render :new }
         format.json { render json: @property.errors, status: :unprocessable_entity }
       end
     end
  end

  def update
    respond_to do |format|
      if @property.update(property_params)
        
        @property.save
        format.html { redirect_to user_properties_path, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to user_properties_path, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @user = User.find(params[:user_id])
      @property = @user.properties.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params[:property].permit(:address,:province,:city,:postcode,:rent,:utilies)
    end
end
