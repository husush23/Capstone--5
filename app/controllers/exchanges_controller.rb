class ExchangesController < ApplicationController
    before_action :authenticate_user!
  
    def new
      @category = Category.find(params[:category_id])
      @exchange = @category.exchanges.build
    end
  
    def create
      @category = Category.find(params[:category_id])
      @exchange = @category.exchanges.build(exchange_params)
      @exchange.author = current_user
    
      if @exchange.save
        redirect_to category_path(@category), notice: 'Exchange added successfully'
      else
        puts @exchange.errors.full_messages # Add this line for debugging
        render :new
      end
    end
        
  
    private
  
    def exchange_params
      params.require(:exchange).permit(:name, :amount, category_ids: [])
    end       
    
  end
  