Tips = {};

Tips.removeTipCard = function(tipId) {
  document.getElementById("tip-" + tipId).parentElement.remove(); 
}