function showCategoryList(){
  const categoryBtn = document.getElementsByClassName("category-list")[0]
  const categoryList = document.getElementById("pull-down")

  categoryBtn.addEventListener('click', function(){
    if (categoryList.getAttribute("style") == "display:none;"){
      categoryList.removeAttribute("style", "display:none;")
    }else {
      categoryList.setAttribute("style", "display:none;")
    }
  })
}
window.addEventListener('load', showCategoryList)