<template>
  <div>
    <input v-model="new_message" /> <button @click="sendMsg">Send</button>

    <div v-for="amessage in messages" :key="amessage">
      {{ amessage }}
    </div>
  </div>
</template>

<script>
  var Centrifuge = require("centrifuge");

export default {
  name: 'HelloWorld',
  data() {
    return {
      new_message: "",
      messages: [],
      centrifuge: null
    }
  },
  props: {

  },
  methods: {
      sendMsg() {
        const vm = this;
        this.centrifuge.publish("channel", {"msg": this.new_message}).then(function(res) {
          vm.new_message = ""; // Clear so the same message is NOT sent again.
          console.log('successfully sent', res);
        }, function(err) {
          console.log('send error', err);
        });


      }
  },
  created() {
    const vm = this;
    this.centrifuge = new Centrifuge("ws://localhost:8000/connection/websocket");
    this.centrifuge.setToken("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwiZXhwIjoxNTk2NTgzNjk5fQ.McKgfwkXbXAkeklDOQ48dMlAATlj19FXy3DQa-HPkwA");

    this.centrifuge.on('connect', function(ctx) {
        console.log("connected", ctx);
    });

    this.centrifuge.on('disconnect', function(ctx) {
        console.log("disconnected", ctx);
    });

    this.centrifuge.subscribe("channel", function(ctx) {
      vm.$nextTick(function () {
        vm.messages.push( ctx.data.msg);
      });
    });

    this.centrifuge.connect();
  }
}
</script>

