function showCategoryList(){
  const categoryBtn = document.getElementsByClassName("category-list")[0]

  categoryBtn.addEventListener('click', function(){
    console.log("click OK")
  })

}
window.addEventListener('load', showCategoryList)