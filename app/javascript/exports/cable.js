import cable from 'actioncable';

let consumer;

export default function (...args) {
  if (!consumer) {
    consumer = cable.createConsumer();
  }

  return consumer.subscriptions.create(...args);
}
