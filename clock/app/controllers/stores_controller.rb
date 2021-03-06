# frozen_string_literal: true

# Store Controller
class StoresController < ApplicationController
  before_action :require_login
  before_action :set_store, only: %i[show edit update destroy]

  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.where(status: true)
  end

  # GET /stores/1
  # GET /stores/1.json
  def show; end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
    @show_btn = true
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Store was successfully created.' }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store = Store.find(params[:id])
    if @store.status
      @store.update(status: false)
      flash[:notice] = "Successfully disabled #{@store.name}."
      flash[:notice] = "Failed to disable #{@store.name}."
      render action: :show
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_store
    @store = Store.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def store_params
    params.require(:store).permit(:name, :address, :phone, :open_time, :close_time, :status)
  end
end
