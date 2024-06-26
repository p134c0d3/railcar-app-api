class OrdersController < ApplicationController
  require_relative '../services/csv_import_service.rb'
  # Authenticate request before any action in the controller
  # before_action :authenticate_request

  def index
    @orders = Order.includes(:raw_material).order(requested_date: :desc)
    render json: OrderBlueprint.render(@orders, view: :normal), status: 200
  end

  def show
    orders = Order.find(params[:id])
    render json: OrderBlueprint.render(orders, view: :normal), status: 200
  end

  def add
    orders = Order.new(order_params)

    if orders.save
      render json: OrderBlueprint.render(orders, view: :normal), status: 200
    else
      render json: { errors: order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    orders = Order.find(params[:id])
    orders.update(order_params)
    if orders.save
      render json: orders, status: 200
    else
      render json: { errors: orders.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def order_raw_material
    orders = Order.find(params[:id])
    raw_material = orders.raw_material
    if raw_material
      render json: raw_material, status: 200
    else
      render json: { errors: raw_material.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def delete
    orders = Order.find(params[:id])

    if orders.destroy
      render json: nil, status: 200
    else
      render json: { errors: orders.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def import
    
      CsvImportService.new.call(params[:file])
      
  end


  private

  def order_params
    params.require(:order).permit(:car_number, :requested_date, :received_date, :extraction_start_date, :weight, :emptied_date, :released_date, :raw_material_id)
  end

end
