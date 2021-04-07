const pay=()=>{


  Payjp.setPublicKey("pk_test_a53ab8ca177a6c8958589fd8");//環境変数に変えること
   

  const form=document.getElementById("charge-form");
  if(!form){return false;}//この処理がないと、他のページにてエラーが発生する
  form.addEventListener("submit",(e)=>{
    e.preventDefault();

    const formResult=document.getElementById("charge-form");
    const formData = new FormData(formResult);
   
    const card= {
      number: formData.get("buyer_order[credit_num]"),
      exp_month: formData.get("buyer_order[exp_month]"),
      exp_year: `20${formData.get("buyer_order[exp_year]")}`,
      cvc:       formData.get( "buyer_order[cvc]")
    };


    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type='hidden'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      } 
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load",pay);
