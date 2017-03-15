class Record < ApplicationRecord
	validates :title, :amount, :date, presence: true
end
