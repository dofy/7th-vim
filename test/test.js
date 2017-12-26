export default {
  config: {

  },
  // on page load
  onLoad (options) {
    let num = 7;
    let arr = ['string', num, 1979];

    arr.forEach((item, index) => {
      console.log(`item: ${item}`)
    })

    return (function () {
      return arr.length;
    })();
  }
}
