class Vote < ApplicationRecord
  belongs_to :work
  has_and_belongs_to_many :users, optional: true

end
