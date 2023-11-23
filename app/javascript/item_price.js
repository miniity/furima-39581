window.addEventListener('turbo:load', () => {
  const itemPriceInput = document.getElementById("item-price");
  const taxPriceOutput = document.getElementById("add-tax-price");
  const profitOutput = document.getElementById("profit");

  itemPriceInput.addEventListener("input", () => {
    const inputValue = parseInt(itemPriceInput.value, 10);

    if (!isNaN(inputValue)) {
      const taxPrice = Math.floor(inputValue * 0.1);
      taxPriceOutput.innerHTML = `${taxPrice}`;

      const profit = inputValue - taxPrice;
      profitOutput.innerHTML = `${profit}`;
    } else {
      taxPriceOutput.innerHTML = "";
      profitOutput.innerHTML = "";
    }
  });
});
