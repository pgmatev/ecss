class SalesController < ApplicationController
  before_action :require_login, :set_sale, only: [:show, :edit, :update, :destroy, :search_product]

  # GET /sales
  # GET /sales.json
  def index
    @sales = current_user.sales.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = current_user.sales.new
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = current_user.sales.new(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        # format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        # format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        # format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        # format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  def search_product
      if params[:search].blank?
        redirect_to(sale_path, alert: "Empty field!") and return
      else
        @parameter = params[:search]
        @results = Product.where("barcode LIKE :barcode AND user_id = :user_id", user_id: current_user, barcode: @parameter)
        @sale.products << @results
        redirect_to(sale_path) and return
      end
  end

  def remove_product
    @sale.products.delete(product)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = current_user.sales.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sale_params
      params.fetch(:sale, {})
    end
end
