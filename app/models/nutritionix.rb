class Nutritionix
  def initialize
    @appId = Rails.application.secrets.app_id
    p @appId
    @appKey = Rails.application.secrets.app_key
    @site = 'https://api.nutritionix.com/v1_1/search/'
  end

  def search(food)
    @json = HTTParty.post(@site,
                            body: { appId: @appId,
                                    appKey: @appKey,
                                    query: food,
                                    fields: ["item_name", "nf_calories"]

    }.to_json,
    headers: { 'Content-Type' => 'application/json' }
                           ).parsed_response
    to_food
  end

  def to_food
    return [] unless @json['hits']
    results = []
    @json['hits'].each do |result|
      food = Food.new
      food.name = result['fields']['item_name']
      food.calories = result['fields']['nf_calories']
      food.quantity = 1
      results << food
    end
    results
  end
end

