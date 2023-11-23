window.addEventListener('turbo:load', () => {
  console.log("OK");
});

// 金額を入力した数値をpriceInputという変数に格納する
const itemPriceInput = document.getElementById("item-price");
console.log(itemPriceInput);
const taxPriceInput = document.getElementById("add-tax-price");
console.log(taxPriceInput);
const profitInput = document.getElementById("profit");
console.log(profitInput);
