const app = Vue.createApp({
    data() {
        return {}
    },

    destroyed() {
        window.removeEventListener('message', this.listener)
    },

    mounted() {
        this.listener = window.addEventListener('message', (e) => {
            const event = e.data;

            if (event.action === 'showBlindfold') {
                $('#blindfold').show();
            }

            if (event.action === 'hideBlindfold') {
                $('#blindfold').hide();
            }
        })
    },

    methods: {}
})

app.mount('#app');