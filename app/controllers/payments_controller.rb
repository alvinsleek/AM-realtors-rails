class PaymentsController < ApplicationController
    class PaymentsController < ApplicationController
        before_action :authenticate_user!
      
        def index
          payments = Payment.all
          render json: payments
        end
      
        def show
          payment = Payment.find(params[:id])
          render json: payment
        end
      
        def new
          payment = Payment.new
        end
      
        def create
          payment = Payment.new(payment_params)
          payment.user_id = current_user.id
      
          if payment.save
            # Process payment using payment gateway
            flash[:success] = "Payment was successful"
            redirect_to payment
          else
            render 'new'
          end
        end
      
        private
      
        def payment_params
          params.require(:payment).permit(:amount, :description)
        end
      end
      
end
