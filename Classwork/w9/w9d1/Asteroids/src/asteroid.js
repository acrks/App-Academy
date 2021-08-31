const MovingObject = require("./moving_object");
const Util = require("./util");

function Asteroid(pos, game) {
    // MovingObject({pos, DEFAULTS.COLOR, DEFAULTS.RADIUS, Util.randomVec(10)});
    let options = { pos: pos, 
        vel: Util.randomVec(DEFAULTS.VEL), 
        radius: DEFAULTS.RADIUS, 
        color: DEFAULTS.COLOR,
        game: game
    };
    console.log(options);
    MovingObject.call(this, options);
};

Util.inherits(Asteroid, MovingObject);

const DEFAULTS = {    
    COLOR: "#ede85f",
    RADIUS: 10,
    VEL: 4
}

const testA = new Asteroid( [30, 30] );

module.exports = Asteroid;