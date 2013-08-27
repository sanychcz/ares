class CompanySearch 
	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend ActiveModel::Naming

	attr_accessor :ico

	validates :ico, presence: true, length: {is: 8}, numericality: { only_integer: true }

	def initialize(attributes = {})
	  attributes.each do |name, value|
	    send("#{name}=", value)
	  end
	end

	def persisted?
		false
	end
end