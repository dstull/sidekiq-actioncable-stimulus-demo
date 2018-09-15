class Driver < ApplicationRecord
  belongs_to :car, touch: true

  delegate :name, to: :car, prefix: true
end