class Vote < ApplicationRecord
  belongs_to :work
  has_many :users

end
