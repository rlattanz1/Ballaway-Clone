# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  price       :integer          not null
#  description :text             not null
#  specs       :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category    :string           not null
#
class Product < ApplicationRecord
    validates :name, :price, :description, :specs, :category, presence: true

    has_many_attached :photos

    has_many :reviews, dependent: :destroy

end
