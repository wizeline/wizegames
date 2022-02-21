import consumer from "channels/consumer"

consumer.subscriptions.create("MatchChannel", {

  initialized() {
  },

  connected() {
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    setTimeout(() => {
      if (data.ready !== undefined) {
      document.getElementById('game_status').innerHTML = ''
      document.getElementById('game_status').innerHTML = 'Game ready:' + data.ready
      }
      this.install()
    }, 200);

    document.getElementById('game_result').innerHTML = data.result
  },

  update() {
  },

  install() {
    document.getElementById('btn_test').addEventListener('click', (e) => {
      const text = document.getElementById('input_test').value
      this.perform('notify', {data: text})
    })
  }
});
