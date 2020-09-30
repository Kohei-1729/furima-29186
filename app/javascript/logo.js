function changeLogo(){
  const changeLogoGreen = document.getElementsByClassName("furima-icon")[0]


  changeLogoGreen.addEventListener('mouseover', function(){
    this.setAttribute("src", "/assets/furima-logo-color-vio-0e6631d5cf16add41e9ac24315def197e3a044cfc93d37a300e61c266b3f5515.png")
  })

  changeLogoGreen.addEventListener('mouseout', function(){
    this.setAttribute("src", "/assets/furima-logo-color-9486ef715c62ec78e487e9fd713395dee60de0966916f621cbc19d0462dbf03b.png")
  })
}

function changingLetter(){
  const changingLetterGreenOne = document.getElementsByClassName('reason-list-blue-text')[0]

  changingLetterGreenOne.addEventListener('mouseover', function(){
    this.setAttribute("style", "color: #cc00ff;")
  })
  changingLetterGreenOne.addEventListener('mouseout', function(){
    this.setAttribute("style", "color: #3ccace;")
  })

}

function changeLetters(){
  const changeLettersOne = document.getElementById("simple")
  const changeLettersTwo = document.getElementById("the-cheapest")
  const changeLettersThree = document.getElementsByClassName('subtitle')[0]

  changeLettersOne.addEventListener('mouseover', function(){
    this.setAttribute("style", "color: #cc00ff;")
  })
  changeLettersOne.addEventListener('mouseout', function(){
    this.setAttribute("style", "color: #3ccace;")
  })

  changeLettersTwo.addEventListener('mouseover', function(){
    this.setAttribute("style", "color: #cc00ff;")
  })
  changeLettersTwo.addEventListener('mouseout', function(){
    this.setAttribute("style", "color: #3ccace;")
  })

  changeLettersThree.addEventListener('mouseover', function(){
    this.setAttribute("style", "color: #cc00ff;")
  })
  changeLettersThree.addEventListener('mouseout', function(){
    this.setAttribute("style", "color: #3ccace;")
  })
}


window.addEventListener('load', changeLogo)
window.addEventListener('load', changingLetter)
window.addEventListener('load', changeLetters)