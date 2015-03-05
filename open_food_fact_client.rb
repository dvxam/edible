require 'httparty'
require 'json'

class OpenFoodFactClient
	@@base_url = "http://world.openfoodfacts.org/api/v0/product/%s.json"

	def self.get(ean)
		response = HTTParty.get(url(ean)).body
		product = JSON.parse(response)['product']
		{
			traces: product['traces_tags'],
			allergens: product['allergens_hierarchy']
		}
	end

	def self.url(ean)
		@@base_url % ean
	end
end
