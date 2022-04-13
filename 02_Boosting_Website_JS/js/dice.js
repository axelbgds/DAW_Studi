class Dice {
  constructor(domElem) {
    this.elem = domElem;
    this.dicePicture = {
      1: "Photos/face-1.png",
      2: "Photos/face-2.png",
      3: "Photos/face-3.png",
      4: "Photos/face-4.png",
      5: "Photos/face-5.png",
      6: "Photos/face-6.png",
    };
  }

  // http://127.0.0.1:5500/Photos/face-6.png

  getPictureByNumber(n) {
    if (this.dicePicture[n] !== undefined) {
      return this.dicePicture[n];
    }
    throw new Error("The number of the dice is not conform");
  }

  randomNumber() {
    let res = Math.ceil(Math.random() * 6);
    res = res !== 0 ? res : 1;
    this.elem.setAttribute("src", this.getPictureByNumber(res));
    return res;
  }
}
