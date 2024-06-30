class OrdersController < ApplicationController
    def new
        @order = Order.new
    end

    def confirm
        @order = Order.new(order_params)
    end

    def create
        @order = Order.new(order_params)
        if params[:button] == 'back'
            return render :new
        end
        if @order.save
            return redirect_to complete_orders_url
        end

        render :confirm
    end

    private

    def order_params
        params.require(:order).permit(:name)
    end
end