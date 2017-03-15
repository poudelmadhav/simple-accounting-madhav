class RecordsController < ApplicationController
	def index
		@records = Record.all
	end

	def create
		@record = Record.create(record_params)
	end

	private

	def record_params
		params.require(:record).permit(:title, :amount, :date)
	end
end
