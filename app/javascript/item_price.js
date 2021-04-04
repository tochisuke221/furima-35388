
function puts_price(){

  const item_price =document.getElementById("item-price");
  const tax_price =document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");


  item_price.addEventListener("input",()=>{
    const tax= Math.floor(item_price.value*0.1);
    tax_price.innerText=tax;
    profit.innerText=item_price.value-tax;
  });
  

}



window.addEventListener('load',()=>puts_price());
