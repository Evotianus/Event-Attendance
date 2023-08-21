const QrcodeStream = window.VueQrcodeReader.QrcodeStream;
new Vue({
  el: '#app',
  components: {
    'qrcode-stream':QrcodeStream,
  },
  data: {
    result: '',
    error: ''
  },
  methods: {
    onDecode (result) {
      this.result = result
    },

    async onInit (promise) {
      try {
      }
    }