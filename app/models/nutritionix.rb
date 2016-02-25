class Nutritionix

  def initialize
    @appId = Rails.application.secrets.app_id
    p @appId
    @appKey = Rails.application.secrets.app_key
    @site = 'https://api.nutritionix.com/v1_1/search/'
  end

  def search(food)
    @result = HTTParty.post(@site,
      body: { appId: @appId,
              appKey: @appKey,
              query: food,
              fields: ["item_name", "nf_calories"]

      }.to_json,
      headers: { 'Content-Type' => 'application/json' }
      ).parsed_response
  end

end
