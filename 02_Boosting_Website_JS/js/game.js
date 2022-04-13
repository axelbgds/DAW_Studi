// Audio variables
const audioDice = new Audio("Audio/game.wav");
const audioHold = new Audio("Audio/hold.wav");
const audioLost = new Audio("Audio/lost.mp3");
const audioWin = new Audio("Audio/win.wav");
const audioNew = new Audio("Audio/new.wav");
const audioDual = new Audio("Audio/dual.wav");
const audioDrink = new Audio("Audio/drink.wav");
const audio = [
  audioDice,
  audioHold,
  audioLost,
  audioWin,
  audioNew,
  audioDual,
  audioDrink,
];

class Game {
  constructor() {
    this.state = "NEW";
    this.dices = [];
    this.players = [];
    this.activePlayer = undefined;
    this.nbDual = 0;
    this.muted = false;

    const dices = $(".dice");
    for (let i = 0; i < dices.length; i++) {
      this.dices.push(new Dice(dices[i]));
    }

    const players = $(".player");
    for (let i = 0; i < players.length; i++) {
      this.players.push(new Player(i, players[i]));
    }
  }

  throwDice() {
    if (this.state !== "STARTED") {
      return;
    }
    const diceRes = [];
    for (let i = 0; i < this.dices.length; i++) {
      diceRes.push(this.dices[i].randomNumber());
    }
    this.checkDice(diceRes);
    this.playSound(audioDice);
    return diceRes;
  }

  checkDice(dices) {
    const total = dices[0] + dices[1];
    if (dices[0] === dices[1]) {
      this.nbDual++;
      this.playSound(audioDual);
      if (this.nbDubal === 3) {
        this.nextPlayer();
        this.playSound(audioLost);
        return;
      }
      if (dices[0] % 2 === 1) {
        this.state = "WAITING";
        for (let i = 0; i < this.players.length; i++) {
          if (i !== this.activePlayer) {
            this.players[i].showTarget(i, total);
          }
        }
        return;
      }
    } else if (total === 3 || total === 5 || total === 7) {
      this.nextPlayer();
      this.playSound(audioLost);
      return;
    }
    this.players[this.activePlayer].addScore(total);
  }

  startGame() {
    this.state = "STARTED";
    this.activePlayer = 0;
    for (let i = 0; i < this.players.length; i++) {
      this.players[i].reset();
    }
    this.playSound(audioNew);
    this.players[this.activePlayer].active();
  }

  nextPlayer() {
    this.players[this.activePlayer].disable();
    this.activePlayer = (this.activePlayer + 1) % this.players.length;
    this.players[this.activePlayer].active();
    this.playSound(audioHold);
    this.nbDual = 0;
  }

  hold() {
    if (
      this.state !== "STARTED" ||
      this.players[this.activePlayer].intermScore === 0
    ) {
      return;
    }
    this.players[this.activePlayer].hold();
    if (this.players[this.activePlayer].score >= 100) {
      this.state = "ENDED";
      this.playSound(audioWin);
    } else {
      this.nextPlayer();
    }
  }

  getPlayer(id) {
    return this.players[id];
  }

  removeTarget() {
    for (let i = 0; i < this.players.length; i++) {
      this.players[i].removeTarget();
    }
    this.state = "STARTED";
  }

  setSound(state) {
    this.muted = state;
  }

  playSound(sound) {
    if (!this.muted) {
      sound.play();
    }
  }

  getScore() {
    let min = undefined;
    let max = undefined;
    let minPlayer = [];
    let maxPlayer = [];
    for (let i = 0; i < this.players.length; i++) {
      // First loop
      if (min === undefined) {
        min = this.players[i].score;
        max = this.players[i].score;
        minPlayer.push(this.players[i]);
        maxPlayer.push(this.players[i]);
        continue;
      }
      // Check min score
      if (this.players[i].score < min) {
        min = this.players[i].score;
        minPlayer = [this.players[i]];
      } else if (this.players[i].score === min) {
        minPlayer.push(this.players[i]);
      }
      // Chek max score
      if (this.players[i].score > max) {
        max = this.players[i].score;
        maxPlayer = [this.players[i]];
      } else if (this.players[i].score === max) {
        maxPlayer.push(this.players[i]);
      }
    }
    return [minPlayer, maxPlayer];
  }
}
