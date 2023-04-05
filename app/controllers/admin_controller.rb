class AdminController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :authorize_admin!

  def dashboard
      new_clients = Client.where(created_at: 1.week.ago..Time.now)
      payments = Payment.all
      available_properties = Property.where(rented: false)
    end 
    
  def manage_properties
      properties = Property.all
    end
  
    def create_property
      property = Property.new(property_params)
      if property.save
        redirect_to admin_manage_properties_path, notice: "Property created successfully."
      else
        render :new
      end
    end
  
    def edit_property
      property = Property.find(params[:id])
    end
  
    def update_property
      property = Property.find(params[:id])
      if property.update(property_params)
        redirect_to admin_manage_properties_path, notice: "Property updated successfully."
      else
        render :edit
      end
    end
  
    def mark_as_rented
      property = Property.find(params[:id])
      property.update(rented: true)
      redirect_to admin_manage_properties_path, notice: "Property marked as rented."
    end
  
    def delete_property
      property = Property.find(params[:id])
      property.destroy
      redirect_to admin_manage_properties_path, notice: "Property deleted successfully."
    end

    class AdminController < ApplicationController
      before_action :authenticate_admin!
    
      def dashboard
        new_clients = Client.where("created_at >= ?", Time.now - 1.week)
        payments = Payment.all
      end
    
      def delete_client
        client = Client.find(params[:id])
        if client.destroy
          flash[:success] = "Client successfully deleted."
        else
          flash[:error] = "An error occurred while deleting the client."
        end
        redirect_to admin_clients_path
      end
    
      
    
  
    private
  
    def property_params
      params.require(:property).permit(:address, :price, :description)
    end
 

    def authorize_admin!
      redirect_to root_path, alert: 'Access denied' unless current_user.admin?
      end
    end
  
    
  
   
  end
  
end
