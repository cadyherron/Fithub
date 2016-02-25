class NutritionixResult
  attr_accessor :name, :calories

  def initialize(name: name, calories: calories)
    @name = name
    @calories = calories
  end

  def self.from_json(json)
    return [] unless json['hits']
    results = []
    json['hits'].each do |food|
      new_name = food['fields']['item_name']
      new_calories = food['fields']['nf_calories']
      results << new(name: new_name, calories: new_calories)
    end
    results
  end
end
