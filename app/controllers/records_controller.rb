class RecordsController < ApplicationController
	def index
		@records = Record.all
	end

	def create
		@record = Record.create(record_params)
		redirect_to root_path
	end

	def edit
	  @record = Record.find(params[:id])
	end

	def update
	  @record = Record.find(params[:id])
	  if @record.update(record_params)
	    redirect_to root_path
	  else
	    redirect_to edit_record_path(params[:id])
	  end
	end

	private

	def record_params
		params.require(:record).permit(:title, :amount, :date)
	end
end
