decko.logo = function() {
    // opts = typeof opts !== 'undefined' ? opts : {};
    this.s = Snap("#decko-animated-logo");
    this.rotationDegrees = ['r345', 'r332', 'r318', 'r308'];
    this.colors = ['#413659', '#90bdf1'];
    this.css_id = "js-svg-card-";
    this.duration = 1000;
    this.easing = mina.bounce;
    this.shadow = this.s.filter(Snap.filter.shadow(1, 0, 11, "#00000", 0.1));
    this.enableShadow = true;
    this.stacked = true;
    this.resizeOnCreate = false;

    //card sizes
    this.cards = [
        // x, y, width, height, roundcornerX, roundcornerY
        // [0, 0, 202, 164, 12.5, 12.5],
        [6, 4, 190, 158, 10, 10],
        [18, 20, 168, 124, 10, 10],
        [33, 28, 140, 106, 10, 10],
        [44, 36, 113, 91, 10, 10]
    ];

}

var _deckoLogo = decko.logo.prototype;
var logoCards = new Array(4);

_deckoLogo.createlogoCards = function() {
    var cards = this.cards,
        colors = this.colors,
        css_id = this.css_id,
        rotationDegrees = this.rotationDegrees,
        s = this.s,
        stacked = this.stacked,
        roc = this.resizeOnCreate,
        es = this.enableShadow,
        shadow = this.shadow;

    for (var i = 0; i < logoCards.length; i++) {
        var x = roc ? cards[i][0] : "0",
            y = roc ? cards[i][1] : "0",
            width = roc ? cards[i][2] : "202",
            height = roc ? cards[i][3] : "164";

        logoCards[i] = s.rect(x, y, width, height, cards[i][4], cards[i][5]).attr({
            fill: (i % 2 === 0) ? colors[0] : colors[1],
            id: css_id + "i",
            filter: es ? shadow : ""
        }).transform((stacked ? "" : rotationDegrees[i]));
    }
}

_deckoLogo.rotate = function(angle) {
    var duration = this.duration,
        easing = this.easing,
        rotationDegrees = this.rotationDegrees;

    for (var i = 0; i < logoCards.length; i++) {
        logoCards[i].animate({
            transform: angle ? angle : rotationDegrees[i]
        }, duration, easing);
    }
}

_deckoLogo.changeSize = function() {
    var cards = this.cards,
        duration = this.duration,
        easing = this.easing;

    for (var i = 0; i < logoCards.length; i++) {
        logoCards[i].animate({
            width: cards[0][2],
            height: cards[0][3],
            x: 0,
            y: 0
        }, duration, easing);
    }
}

_deckoLogo.changeToOriginal = function() {
    var cards = this.cards,
        duration = this.duration,
        easing = this.easing;

    for (var i = 0; i < logoCards.length; i++) {
        logoCards[i].animate({
            width: cards[i][2],
            height: cards[i][3],
            x: cards[i][0],
            y: cards[i][1]
        }, duration, easing);
    }
}

_deckoLogo.animateSequence = function() {
    var $this = this;


    setTimeout(function() { $this.rotate(); }, 1000);
    setTimeout(function() { $this.changeToOriginal(); }, 2500);

    // setTimeout(function() { $this.changeSize(); }, 1000);
    // setTimeout(function() { $this.rotate("r0"); }, 2200);
    // setTimeout(function() { $this.rotate(); }, 3400);
}