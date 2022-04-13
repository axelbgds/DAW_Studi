const game = new Game();

jQuery(document).ready(() => {
  let muted = false;

  $("#mute").on("click", (e) => {
    const elem = e.target;
    muted = !muted;
    game.setSound(muted);

    if (muted) {
      elem.innerHTML = "&#128263;";
    } else {
      elem.innerHTML = "&#128266;";
    }
  });

  $("#new-game").on("click", () => {
    game.startGame();
    countdown(60, 60); //add sound drink
  });

  $("#throw").on("click", () => {
    game.throwDice();
  });

  $("#hold").on("click", () => {
    game.hold();
  });

  $("body").on("click", "button.substract", (e) => {
    const elem = e.target;
    const id = elem.getAttribute("data-id");
    const total = elem.getAttribute("data-total");
    const player = game.getPlayer(id);
    // Si player == undefined
    player.substractScore(total);
    game.removeTarget();
  });
});

// jQuery slideToggle
jQuery(document).ready(() => {
  $("#title-rules").click(function () {
    $("#rules").slideToggle("400", "linear");
  });

  $("#credits").click(function () {
    $("#footer-child").slideToggle("400", "linear");
  });
});

let countdowntimer = undefined;

function countdown(second, interval) {
  $("#counter").text(second);
  if (countdowntimer !== undefined) {
    clearInterval(countdowntimer);
  }
  if (game.state == "ENDED") {
    return;
  }
  countdowntimer = setTimeout(function () {
    if (second > 0) {
      countdown(second - 1, interval);
    } else {
      const [minPlayer, maxPlayer] = game.getScore();
      let minPlayerText = "";
      let maxPlayerText = "";
      for (let i = 0; i < minPlayer.length; i++) {
        minPlayerText += " " + (minPlayer[i].id + 1);
      }
      for (let i = 0; i < maxPlayer.length; i++) {
        maxPlayerText += " " + (maxPlayer[i].id + 1);
      }
      alert(
        "C'est au joueur" +
          minPlayerText +
          " et au joueur" +
          maxPlayerText +
          " de boire un petit coup ! (A la santé du colonnel)."
      );
      countdown(interval, interval);
    }
  }, 1000);
}
