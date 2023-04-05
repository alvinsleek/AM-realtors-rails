class PropertiesController < ApplicationController

        def index
          properties = Property.all
          render json: properties
        end
        
        def show
          property = Property.find(params[:id])
          render json: property
        end

        def create
          property = Property.new(property_params)
      
          if property.save
            render json: property, status: :created
          else
            render json: property.errors, status: :unprocessable_entity
          end
        end
      
        def update
          property = Property.find(params[:id])
      
          if property.update(property_params)
            render json: property
          else
            render json: property.errors, status: :unprocessable_entity
          end
        end
      
        def destroy
          property = Property.find(params[:id])
          property.destroy
        end
        def book
          property = Property.find(params[:id])
          
          if property.rented
            flash[:error] = "Property is already rented."
            redirect_to properties_path
          else
            property.update(rented: true)
            flash[:success] = "You have successfully rented this property!"
            redirect_to payments_path
          end
        end

        private

        def property_params
          params.require(:property).permit(:name, :address, :rent)
        end
      
      
end
