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
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
