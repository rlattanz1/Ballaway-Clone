class AddRecommendationColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :recommendation, :boolean, default: true
  end
end
