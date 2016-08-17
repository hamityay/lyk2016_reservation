class PlacesController < ApplicationController
	before_action :set_place, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_owner!, except: [:index, :show]
	before_action :authorize_owner!, only: [:edit, :update, :destroy]
	#before_action :authenticate_costumer!, except: [:index, :show]

	def new
		@place = Place.new
		load_form_data
	end

	def  index
		@places = Place.all
	end

	def show
	end

	def create
		@place = current_owner.places.new(place_params)

		if @place.save
			flash[:success] = 'Place infos saved successfuly'
			redirect_to place_path(@place)
		else
			load_form_data
			render :new
		end
	end

	def edit
		load_form_data
	end

	def update


		if @place.update(place_params)
			flash[:success] = 'Place infos updated successfuly'
			redirect_to place_path(@place)
		else
			load_form_data
			render :edit
		end

	end

	def destroy

		@place.destroy
		flash[:warning] = 'Place infos deleted successfuly'
		redirect_to places_path
	end

	private
		def authorize_owner!
			redirect_to root_path, notice: 'Not authorized...' unless @place.owner_id == current_owner.id
		end

		def set_place
			@place = Place.find(params[:id])
		end

		def place_params
			params.require(:place).permit(:name, :adress, :phone_number, :city, :description, :contact_mail, :established_at, :category_id, food_ids: [])
		end

		def load_form_data
			@categories = Category.all.collect { |c| [c.name, c.id] }
			@foods = Food.all
		end
end
