class RecordsController < ApplicationController
	def index
		@records = Record.all.order('date DESC').paginate(:page => params[:page], :per_page => 3)
	end

	def create
		@record = Record.create(record_params)
		if @record.valid?
	    # Implement later
	 	else
	    # Implement later
	 	end
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

	def destroy
	  @record = Record.find(params[:id])
	  @record.destroy
	  redirect_to root_path
	end

	private

	def record_params
		params.require(:record).permit(:title, :amount, :date)
	end
end
