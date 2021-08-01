window.APP = {
    template: '#app_template',
    name: 'app',
    data() {
        return {
            cards: [
                // {
                //     rank: "legendary",
                //     label: "Irsyad Fauzan",
                //     images: "img/avatar1.png",
                //     description: "God, Height: 168, Weight: 80",
                //     term: "GOD",
                //     health: 200,
                //     attack: 99,
                //     icon: "",
                //     isFliped: true,
                //     withCase: false,
                //     colors: {
                //         color1: "#e09a3d",
                //         color2: "#41ece4",
                //         color3: "#ff9f9f",
                //         color4: "#ff7676",
                //         border_size: 6,
                //         border_color: "#e65050",
                //         shining: true,
                //         sparkles: true,
                //         bg_images: null,
                //     }
                // },
                // {
                //     rank: "basic",
                //     label: "Yumavol",
                //     images: "img/avatar3.png",
                //     description: "Trash, Height: 172, Weight: 68",
                //     term: "Sleeping Everytime",
                //     health: 80,
                //     attack: 20,
                //     icon: "",
                //     isFliped: true,
                //     withCase: false,
                //     colors: {
                //         color1: "#fff",
                //         color2: "#fff",
                //         color3: "#fff",
                //         color4: "#fff",
                //         border_size: 6,
                //         border_color: "#999",
                //         shining: false,
                //         sparkles: true,
                //         bg_images: "img/background.jpg",
                //     }
                // },
                // {
                //     rank: "basic",
                //     label: "Yumavol",
                //     images: "img/avatar3.png",
                //     description: "Trash, Height: 172, Weight: 68",
                //     term: "Sleeping Everytime",
                //     health: 80,
                //     attack: 20,
                //     icon: "",
                //     isFliped: true,
                //     withCase: true,
                //     colors: {
                //         color1: "#fff",
                //         color2: "#fff",
                //         color3: "#fff",
                //         color4: "#fff",
                //         border_size: 6,
                //         border_color: "#999",
                //         shining: true,
                //         sparkles: false,
                //         bg_images: "img/background.jpg",
                //     }
                // },
                // {
                //     rank: "basic",
                //     label: "Yumavol",
                //     images: "img/avatar3.png",
                //     description: "Trash, Height: 172, Weight: 68",
                //     term: "Sleeping Everytime",
                //     health: 80,
                //     attack: 20,
                //     icon: "",
                //     isFliped: true,
                //     withCase: true,
                //     colors: {
                //         color1: "#fff",
                //         color2: "#fff",
                //         color3: "#fff",
                //         color4: "#fff",
                //         border_size: 6,
                //         border_color: "#999",
                //         shining: true,
                //         sparkles: true,
                //         bg_images: "img/background.jpg",
                //     }
                // },
                // {
                //     rank: "basic",
                //     label: "Yumavol",
                //     images: "img/avatar3.png",
                //     description: "Trash, Height: 172, Weight: 68",
                //     term: "Sleeping Everytime",
                //     health: 80,
                //     attack: 20,
                //     icon: "",
                //     isFliped: true,
                //     withCase: true,
                //     colors: {
                //         color1: "#fff",
                //         color2: "#fff",
                //         color3: "#fff",
                //         color4: "#fff",
                //         border_size: 6,
                //         border_color: "#999",
                //         shining: true,
                //         sparkles: true,
                //         bg_images: "img/background.jpg",
                //     }
                // }
            ],
            styles: null,
            displayOpenAnother: false,
            displayOpenInventory: false,
            displayClose: false,
            remain: 0,
            isShow: false,
        };
    },
    destroyed() {
        window.removeEventListener('message', this.listener);
        window.removeEventListener('keyup', this.EVENT_KEYPRESS);
    },
    mounted() {
        this.listener = window.addEventListener('message', (event) => {
            const item = event.data || event.detail; //'detail' is for debuging via browsers
            if (this[item.type]) {
                this[item.type](item);
            }
        });
        // document.onkeyup = function (data) {
        //     if (data.which == 27) {
        //         $('#container-kartu').fadeOut(0);
        //         $.post('https://mi-card/escape', JSON.stringify({}));
        //         this.displayClose = false;
        //         this.displayOpenInventory = false;
        //         this.displayOpenAnother = false;
        //     }
        // };
        window.addEventListener('keyup', this.EVENT_KEYPRESS);
    },
    methods: {
        AddCards({ card }) {
            this.cards.push(card);
        },
        ON_OPEN() {
            this.isShow = false;
            this.cards = [];
        },
        ON_ADD_CARDS(item) {
            this.cards = item.cards;
            if (item.remain > 0) {
                this.remain = item.remain;
                this.displayOpenAnother = true;
                this.displayOpenInventory = false;
                this.displayClose = false;
            } else {
                this.displayClose = true;
                this.displayOpenInventory = true;
            }
        },
        ON_CLOSE() {
            this.cards = [];
        },
        ON_SHOW_CARD(item) {
            this.isShow = true;
            this.cards = [item.card];
        },
        SHOW_OPEN_ANOTHER(show) {
            this.displayOpenAnother = show;
        },
        SHOW_OPEN_INVENTORY(show) {
            this.displayOpenInventory = show;
        },
        SHOW_CLOSE(show) {
            this.displayClose = show;
        },

        EVENT_KEYPRESS(event) {
            if (this.isShow) {
                // data.getModifierState("Shift") &&
                if (event.which == 27) {
                    $('#container-kartu').fadeOut(0);
                    $.post('https://mi-card/escape', JSON.stringify({}));
                    this.displayClose = false;
                    this.displayOpenInventory = false;
                    this.displayOpenAnother = false;
                }
            }
        },

        /* Method Button */
        openAnother: function (event) {
            $('#container-kartu').fadeOut(0);
            $.post('https://mi-card/openAnother', JSON.stringify({ remain: this.remain }));
            this.displayClose = false;
            this.displayOpenInventory = false;
            this.displayOpenAnother = false;
        },
        openInventory: function (event) {
            $('#container-kartu').fadeOut(0);
            $.post('https://mi-card/openInventory', JSON.stringify({}));
            this.displayClose = false;
            this.displayOpenInventory = false;
            this.displayOpenAnother = false;
        },
        close: function (e) {
            $('#container-kartu').fadeOut(0);
            $.post('https://mi-card/escape', JSON.stringify({}));
            this.displayClose = false;
            this.displayOpenInventory = false;
            this.displayOpenAnother = false;
        }
    },
};
