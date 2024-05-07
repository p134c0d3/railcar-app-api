class RawMaterialController < ApplicationController
  # Authenticate request before any action in the controller
  # before_action :authenticate_request
  
  def index
    @raw_materials = RawMaterial.all
    render json: @raw_materials, status: 200
  end

  def show
    @raw_material = RawMaterial.find(params[:id])
    render json: @raw_material, status: 200
  end

  def add
    raw_material = RawMaterial.new(raw_material_params)

    if raw_material.save
      render json: raw_material, status: 201
    else
      render json: { errors: raw_material.errors }, status: :unprocessable_entity
    end
  end

  def update
    raw_material = RawMaterial.find(params[:id])
    raw_material.update(raw_material_params)
    if raw_material.save
      render json: raw_material, status: 200
    else
      render json: { errors: raw_material.errors }, status: :unprocessable_entity
    end
  end

  def raw_material_orders
    raw_material = RawMaterial.find(params[:id])
    @orders = raw_material.orders
    if @orders
      render json: @orders, status: 200
    else
      render json: { errors: @orders.errors }, status: :unprocessable_entity
    end
  end

  def delete
    raw_material = RawMaterial.find(params[:id])
    
    if raw_material.destroy
      render json: raw_material, status: 200
    else
      render json: { errors: raw_material.errors }, status: :unprocessable_entity
    end
  end

  private

  def raw_material_params
    params.require(:raw_material).permit(:material_name)
  end
end
