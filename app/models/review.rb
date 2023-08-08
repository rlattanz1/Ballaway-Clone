# == Schema Information
#
# Table name: reviews
#
#  id             :bigint           not null, primary key
#  body           :string           not null
#  rating         :integer          not null
#  title          :string           not null
#  value          :integer
#  quality        :integer
#  durability     :integer
#  user_id        :bigint           not null
#  product_id     :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  recommendation :boolean          default(TRUE)
#
class Review < ApplicationRecord
  validates :body, :rating, :title, :user_id, :product_id, :value, :quality, :durability, presence: true
  validates :recommendation, inclusion: {in: [true, false], allow_nil: true, allow_blank: true}

  belongs_to :user
  belongs_to :product

end
