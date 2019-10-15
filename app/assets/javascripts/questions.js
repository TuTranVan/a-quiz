$(document).on('turbolinks:load', function() {
  (function() {
    App.questions = App.cable.subscriptions.create({
      channel: 'QuestionsChannel'
    },
    {
      connected: function() {},
      disconnected: function() {},
      received: function(data) {
        $('#question-data').load(window.location + " #question-data");
        $('#list-notification').load(window.location + " #list-notification");
        $('#counter-notification').html(data.counter);
      },
    });
  }).call(this);
})
