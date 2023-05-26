class RoomsController < ApplicationController
	before_action :authenticate_user!
	before_action :private_room, only: [:show]

	def index
		@rooms = Room.all
	end

	def show
		@room = Room.find(params[:id])
		@messages = @room.messages
	end

	def new
		@room = Room.new
	end

	def create
		@room = Room.new(room_params)
		if @room.save
			current_user.participants.create(room: @room, is_room_admin: true)
			redirect_to @room
		else
			render :new, status: :unprocessable_entity
		end
	end

	def edit
		@room = Room.find(params[:id])
	end

	def update
		@room = Room.find(params[:id])
		if @room.update(room_params)
			redirect_to @room
		else
			render :edit, status: :unprocessable_entity
		end
	end

	private
		def room_params
			params.require(:room).permit(:name, :is_private)
		end

		def private_room
			if Room.find(params[:id]).is_private?
				unless current_user.participants.where(room_id: params[:id]).exists?
					redirect_to rooms_path, alert: "You don't have access to this room"
				end
			end
		end
end
  