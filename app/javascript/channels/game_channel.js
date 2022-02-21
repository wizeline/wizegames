import consumer from "channels/consumer"

consumer.subscriptions.create("GameChannel", {
  initialized() {
    this.update = this.update.bind(this)
    document.addEventListener("turbolinks:load", this.update)
  },
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    setTimeout(() => {
      document.getElementById('current_players').innerHTML = ''
      document.getElementById('current_players').innerHTML = 'Current players:' + data.game_data
    }, 200);


    // Called when there's incoming data on the websocket for this channel
  },
  update() {
    console.log('helo update')
    console.log(document.visibilityState === 'visible')
  }
});
