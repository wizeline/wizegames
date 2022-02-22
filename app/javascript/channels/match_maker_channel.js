import consumer from "channels/consumer"

consumer.subscriptions.create("MatchMakerChannel", {

  initialized() {
  },

  connected() {
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    setTimeout(() => {
      console.log(data)
      if (data.ready !== undefined) {
      document.getElementById('game_status').innerHTML = ''
      document.getElementById('game_status').innerHTML = 'Game ready:' + data.ready

      // document.getElementById('game_btn').disabled = !data.ready
      }
      if (data.result !== undefined) {
        document.getElementById('game_result').innerHTML = data.result
      }
      if (data.game_data !== undefined) {
        document.getElementById('current_players').innerHTML = ''
        document.getElementById('current_players').innerHTML = 'Current players:' + data.game_data
      }
      this.install()
    }, 200);
  },

  update() {
  },

  install() {
  }
});
