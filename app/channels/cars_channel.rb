class CarsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'cars'
  end
end
