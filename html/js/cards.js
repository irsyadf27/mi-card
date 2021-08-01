Vue.component("cards", {
    template: "#cards_template",
    data() {
        return {
            style: ""
        }
    },
    mounted() {
        this.isSparkles = this.colors.sparkles
        this.isShining = this.colors.shining
    },
    // mounted() {
    //     if (this.rank == "legendary") {
    //         this.isLegendary = true;
    //     } else if (this.rank == "rare") {
    //         this.isRare = true;
    //     } else {
    //         this.isBasic = true;
    //     }
    // },
    computed: {
        images2() {
            return '<img src="' + this.images + '"  v-html="images"/>';
        },
        inlineCSS: function (e) {
            css = "";
            // if (this.colors.bg_images != null) {
            //     css += "background: url('" + this.colors.bg_images + "');"
            // } else {
            css += "--color1: " + this.colors.color1 + ";--color2: " + this.colors.color2 + ";--color3: " + this.colors.color3 + ";--color4: " + this.colors.color4 + ";";
            //}
            css += "border: " + this.colors.border_size + "px solid " + this.colors.border_color + ";"
            return css;
        },
        backgroundCSS: function (e) {
            css = "";
            // if (this.withCase) {
            //     css = "border: " + this.colors.border_size + "px solid " + this.colors.border_color + ";";
            // }

            if (this.colors.bg_images != null) {
                css += "background: url('" + this.colors.bg_images + "');";
            }
            return css;
        }
    },
    methods: {
        capitalize(str) {
            return str.charAt(0).toUpperCase() + str.slice(1);
        },
        flipCard: function (event) {
            this.isFliped = true;
        },
        mouseOut: function (e) {
            this.isActive = false
        }
    },
    props: {
        rank: {
            type: String,
            default: "basic"
        },
        label: {
            type: String,
            default: ""
        },
        health: {
            type: String,
            default: ""
        },
        images: {
            type: String,
            default: ""
        },
        description: {
            type: String,
            default: ""
        },
        term: {
            type: String,
            default: ""
        },
        attack: {
            type: String,
            default: ""
        },
        isFliped: {
            type: Boolean,
            default: false
        },
        withCase: {
            type: Boolean,
            default: false
        },
        isActive: {
            type: Boolean,
            default: false
        },
        index: {
            type: Number,
            default: null
        },
        colors: {
            type: Object,
            default: null
        },

        // Effect
        isShining: {
            type: Boolean,
            default: false
        },
        isSparkles: {
            type: Boolean,
            default: false
        }
    }
});
