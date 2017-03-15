class RecordsController < ApplicationController
	def index
		@records = Record.all.order('date DESC').paginate(:page => params[:page], :per_page => 30)
	end

	def create
		@record = Record.create(record_params)
		if @record.valid?
	    	flash[:success] = "A record has been successfully created!"
	    	redirect_to root_path
	 	else
	    	flash[:alert] = "Woops! Looks like there has been an error!"
	    	redirect_to new_record_path
	 	end
	end

	def edit
	  @record = Record.find(params[:id])
	end

	def update
	  @record = Record.find(params[:id])
	  if @record.update(record_params)
	  	flash[:success] = "A record has been successfully updated!"
	    redirect_to root_path
	  else
	  	flash[:alert] = "Woops! Looks like there has been an error!"
	    redirect_to edit_record_path(params[:id])
	  end
	end

	def destroy
	  @record = Record.find(params[:id])
	  @record.destroy
	  flash[:success] = "The record was successfully deleted!"
	  redirect_to root_path
	end

	private

	def record_params
		params.require(:record).permit(:title, :amount, :date)
	end
end
