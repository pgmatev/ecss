class SalesController < ApplicationController
    before_action :set_sale, only: [:show, :edit, :update, :destroy]
  
    # GET /sales
    # GET /sales.json
    def index
      @sales = sale.all
    end
  
    # GET /sales/1
    # GET /sales/1.json
    def show
    end
  
    # GET /sales/new
    def new
      @sale = sale.new
    end
  
    # GET /sales/1/edit
    def edit
    end
  
    # POST /sales
    # POST /sales.json
    def create
      @user = 
      if signed_in?
        @sale = sale.new(sale_params)
    
        respond_to do |format|
          if @sale.save
            format.html { redirect_to @sale, notice: 'sale was successfully created.' }
            format.json { render :show, status: :created, location: @sale }
          else
            format.html { render :new }
            format.json { render json: @sale.errors, status: :unprocessable_entity }
          end
        end
      end
    end
  
    # PATCH/PUT /sales/1
    # PATCH/PUT /sales/1.json
    def update
      respond_to do |format|
        if @sale.update(sale_params)
          format.html { redirect_to @sale, notice: 'sale was successfully updated.' }
          format.json { render :show, status: :ok, location: @sale }
        else
          format.html { render :edit }
          format.json { render json: @sale.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /sales/1
    # DELETE /sales/1.json
    def destroy
      @sale.destroy
      respond_to do |format|
        format.html { redirect_to sales_url, notice: 'sale was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_sale
        @sale = sale.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def sale_params
        params.fetch(:sale, {})
      end
  end
  