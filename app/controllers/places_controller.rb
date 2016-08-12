class PlacesController < ApplicationController

	def new
		@place = Place.new
	end

	def  index
		@places = Place.all
	end

	def show
		@place = Place.find(params[:id])
	end

	def create
		@place = Place.new(place_params)

		if @place.save
			redirect_to place_path(@place)
		else
			render 'new'
		end
	end

	def edit
		@place = Place.find(params[:id])
	end

	def update
		@place = Place.find(params[:id])

		if @place.update(place_params)

			redirect_to place_path(@place)
		else
			render 'edit'
		end

	end

	private
		def place_params
			params.permit(:name, :adress, :phone_number, :city, :description, :contact_mail, :established_at)
		end
end
