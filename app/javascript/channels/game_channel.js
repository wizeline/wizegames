import consumer from "channels/consumer"

consumer.subscriptions.create("GameChannel", {
  initialized() {
    console.log('init channel')
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
      if (data.status === 'setup') {
        this.install()
      }
      if (data.active !== undefined) {
        document.getElementById('game_btn').disabled = !data.active
      }
    }, 200);

    // Called when there's incoming data on the websocket for this channel
  },
  update() {
    console.log(document.visibilityState === 'visible')
  },

  install() {
    document.getElementById('game_btn').addEventListener('click', (e) => {
      const text = document.getElementById('game_input').value
      this.perform('notify', {data: text})
    })
  }
});
