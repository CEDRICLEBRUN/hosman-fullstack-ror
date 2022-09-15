class PropertiesController < ApplicationController
  def index
    @properties = Property.order(created_at: :desc)
  end

  def new
  end

  def create
    @property = Property.new(property_params)

    experts = Expert.where(city: @property.city, nb_sales: ..14)
    experts_array = array_experts(experts)

    sorted_experts = experts_array.sort_by { |el| el[1] }

    @property.expert = sorted_experts.last.first unless sorted_experts.empty?

    if @property.save
      redirect_to properties_path
    else
      render "pages/home"
    end
  end

  private

  def property_params
    params.require(:property).permit(:city, :price)
  end

  def calcul_score(expert_score, expert_sales)
    expert_score * ((15 - expert_sales).to_f / 15 * 2) if expert_score.to_f > 0.0
  end

  def array_experts(experts)
    array = []
    experts.each do |expert|
      score =
        case @property.price
        when ...500000
          calcul_score(expert.score_a, expert.nb_sales)
        when 500000...1000000
          calcul_score(expert.score_b, expert.nb_sales)
        else
          calcul_score(expert.score_c, expert.nb_sales)
        end

      (array << [expert, score]) if score
    end
    array
  end

end
