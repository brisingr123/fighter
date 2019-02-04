class InvestorTag < ApplicationRecord
	has_and_belongs_to_many :investors
end
