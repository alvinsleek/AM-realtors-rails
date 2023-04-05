class ClientsController < ApplicationController
    before_action :authenticate_user!

    def index
        client = current_user.client
    end

    def new
        client = Client.new
    end

    def create
        client = Client.new(client_params)
        client.user = current_user

        if client.save
            redirect_to new_mission_path, notice: 'Account created. Log in!'
        else
            render :edit
        end
    end

    private

    def client_params
        params.require(:client).permit(:name, :email, :password, :password_confirmation, :phone_number)
    end

end
