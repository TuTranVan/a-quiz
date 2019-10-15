$(document).on('turbolinks:load', function() {
  (function() {
    App.notification_updates = App.cable.subscriptions.create({
      channel: 'NotificationUpdatesChannel'
    },
    {
      connected: function() {},
      disconnected: function() {},
      received: function(data) {
        $('#list-notification').load(window.location + " #list-notification");
        $('#counter-notification').html(data.counter);
      },
    });
  }).call(this);
})
