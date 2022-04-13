class Player {
  constructor(id, domElem) {
    this.id = id;
    this.elem = $(domElem);
    this.score = 0;
    this.intermScore = 0;
  }

  active() {
    this.elem.css("box-shadow", "0px 0px 15px #ff661a");
  }

  disable() {
    this.elem.css("box-shadow", "0px 0px 0px transparent");
    this.intermScore = 0;
    this.elem.find("p.score-current").text(this.intermScore);
  }

  reset() {
    this.score = 0;
    this.intermScore = 0;
    this.disable();
    this.elem.find("p.score-global").text(this.score);
    this.elem.find("p.score-current").text(this.intermScore);
    // supprimer le bouton substract
  }

  hold() {
    this.score += this.intermScore;
    this.elem.find("p.score-global").text(this.score);
  }

  addScore(total) {
    this.intermScore += total;
    this.elem.find("p.score-current").text(this.intermScore);
  }

  substractScore(total) {
    this.score -= total;
    if (this.score < 0) {
      this.score = 0;
    }
    this.elem.find("p.score-global").text(this.score);
  }

  showTarget(id, total) {
    this.elem
      .find("div.div-score-global")
      .append(
        '<button class="substract" data-id=' +
          id +
          " data-total=" +
          total +
          ">Retirer " +
          total +
          "</button>"
      );
  }

  removeTarget() {
    this.elem.find("button.substract").remove();
  }
}
