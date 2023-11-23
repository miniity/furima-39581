window.addEventListener('turbo:load', () => {

  const itemPriceInput = document.getElementById("item-price");
  const taxPriceOutput = document.getElementById("add-tax-price");
  const profitOutput = document.getElementById("profit");

  itemPriceInput.addEventListener("input", () => {
    const inputValue = parseInt(itemPriceInput.value, 10);
    console.log(inputValue);

    if (!isNaN(inputValue)) {
      // 販売手数料の計算（10%）
      const taxPrice = Math.floor(inputValue * 0.1);
      taxPriceOutput.innerHTML = `${taxPrice}`;

      // 利益の計算（売価 - 販売手数料）
      const profit = inputValue - taxPrice;
      profitOutput.innerHTML = `${profit}`;
    } else {
      // 入力が数字でない場合、表示をクリア
      taxPriceOutput.innerHTML = "";
      profitOutput.innerHTML = "";
    }
  });
});