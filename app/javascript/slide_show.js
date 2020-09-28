const pics_src = ["url(/assets/furima-header01-a1a4be0d864c29338b03d163957f9fd26b20f7c1fa0d05c17b603ec54d249ebe.png)","url(/assets/furima-header03-5937b6a2714e124c21c5fb905613948451c85870607f103109e7efca69587173.jpg)","url(/assets/furima-header04-18c7fdb69fb5ab076e927241c196715a120e4ca51e87bfd01fc19b34f66cfea7.jpg)"]
let num = 0

function slideShowTimer(){
  if (num === 2){
    num = 0
  }else{
    num += 1
  }
  document.getElementById("slide_show").style.backgroundImage = pics_src[num]
}

setInterval(slideShowTimer, 5000)