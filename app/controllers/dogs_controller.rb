class DogsController < ApplicationController
	def index
		@dogs = Dog.all
	end

	def show
		@id = params[:id]
		@dog = Dog.find(@id)
	end

	def new
		@dog = Dog.new
	end

	def create
		@dog = Dog.new(dog_params)
		if @dog.save
			redirect_to @dog
		else
			render "new"
		end
	end

	private

	def dog_params
		params.require(:dog).permit(:name, :age) #Returns a hash that was the value of "name" and "email" from the value of "user" in params.
  	end
end
