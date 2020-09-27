function changeLogo(){
  const changeLogoGreen = document.getElementsByClassName("furima-icon")[0]


  changeLogoGreen.addEventListener('mouseover', function(){
    this.setAttribute("src", "/assets/furima-logo-color-vio-0e6631d5cf16add41e9ac24315def197e3a044cfc93d37a300e61c266b3f5515.png")
  })

  changeLogoGreen.addEventListener('mouseout', function(){
    this.setAttribute("src", "/assets/furima-logo-color-9486ef715c62ec78e487e9fd713395dee60de0966916f621cbc19d0462dbf03b.png")
  })
}

window.addEventListener('load', changeLogo)