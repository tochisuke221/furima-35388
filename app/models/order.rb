class Order < ApplicationRecord
  attr_accessor :token

  belongs_to :buyer
end
