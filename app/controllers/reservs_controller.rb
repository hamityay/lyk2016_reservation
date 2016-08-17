class ReservsController < ApplicationController
  before_action :authenticate_costumer!
  before_action :set_place
  before_action :set_reserv, only: [:destroy]

  def create
    @reserv = @place.reservs.build(reserv_params)
    @reserv.costumer_id = current_costumer.id

    if @reserv.save
      redirect_to @place, notice: 'Reservation has been made.'
    else
      redirect_to @place, notice: 'Reservation could not save'
    end

  end

  def update

  end

  def destroy
    @reserv.destroy
    redirect_to @place, notice: 'Reservation was deleted.'
  end

  private

    def set_reserv
      @reserv = Reserv.find(params[:id])
    end

    def set_place
      @place = Place.find(params[:place_id])
    end

    def reserv_params
      params.require(:reserv).permit(:number_of_p, :date)
    end
end
