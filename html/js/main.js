var open = null;
let hasFlippedCard = false;
let firstCard, secondCard;
let lockBoard = false;
let currentMenu;
let cards = null;

//$('#cards-container').fadeOut(0);

$(function () {

    // resetCard();
    // currentMenu = $('#container-kartu');
    // setTimeout(function () {
    //     currentMenu.fadeIn(500);
    // }, 1);
    window.addEventListener('message', function (event) {
        if (event.data.type == "buka-kartu") {
            open = event.data.enable;
            if (open) {
                document.body.style.display = "block";
                currentMenu = $('#' + event.data.menu);
                isService = event.data.isService;

                cards = event.data.cards;

                setTimeout(function () {
                    currentMenu.fadeIn(500);
                }, 1);
            } else {
                currentMenu.fadeOut(500);
                setTimeout(function () {
                    document.body.style.display = "none";
                }, 500);
            }
        }
    });

    document.onkeyup = function (data) {
        if (open) {
            // data.getModifierState("Shift") &&
            if (data.which == 27) {
                $('#container-kartu').fadeOut(0);
                $.post('https://mi-card/escape', JSON.stringify({}));
            }
        }
    };

});