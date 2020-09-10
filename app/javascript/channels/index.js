function price(){
  
   const putTag = document.getElementById("item-price");
   const commission = document.getElementById("add-tax-price");
   const profit = document.getElementById("profit");
   
     putTag.addEventListener('keyup', () => {
         const tag = putTag.value; 
         
       if (tag >= 300 && tag <= 9999999){
         let fee = tag * 0.1
         let gets = tag- fee
         commission.textContent = fee;
         profit.textContent = gets;
     } else {
       let fee = '-';
       let gains = '-';
       commission.textContent = fee;
       profit.textContent = gains;
     }
   });
  }
  window.addEventListener('load', price);