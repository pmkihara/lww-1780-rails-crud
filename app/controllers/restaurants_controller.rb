class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  def index
    # lista todos os restaurantes
    @restaurants = Restaurant.all
  end

  def show
    # mostra os detalhes de um restaurante
  end

  def new
    # mostra o formulário para criar um restaurante novo
    # precisamos de uma instância de Restaurant para criar o formulário
    @restaurant = Restaurant.new
  end

  def create
    # recebe um formulário para criar um restaurante novo
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    # não precisamos mostrar uma página de create, redirecionamos para a show do
    # restaurante criado
    redirect_to restaurant_path(@restaurant)
  end

  def edit
    # mostra o formulário para editar um restaurante
  end

  def update
    # recebe um formulário para editar um restaurante
    @restaurant.update(restaurant_params)
    # não precisamos mostrar uma página de update, redirecionamos para a show do
    # restaurante editado
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    # apaga um restaurante
    @restaurant.destroy
    # não precisamos mostrar uma página de destroy, redirecionamos para o index
    # de restaurantes
    redirect_to restaurants_path, status: :see_other
  end

  private

  def set_restaurant
    # encontra um restaurante pelo id que está na URL
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    # autoriza expressamente os atributos de restaurante (strong params)
    params.require(:restaurant).permit(:name, :address, :rating)
  end
end
