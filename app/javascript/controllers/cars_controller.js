import { Controller } from 'stimulus';
import createChannel from '../exports/cable';

export default class extends Controller {
  connect() {
    this.initChannel();
  }

  initChannel() {
    createChannel('CarsChannel', {
      received(data) {
        const carRow = $(`#car_id_${data.car_id}`);
        const driverChanges = carRow.find('.cars--driver-changes');
        const drivers = carRow.find('.cars--drivers');
        driverChanges.text(data.driver_changes);
        drivers.text(data.drivers);
      },
    });
  }
}
