Tips = {};

Tips.removeTipCard = function(tipId) {
  tip_card = document.getElementById("tip-" + tipId);
  if(tip_card.nextElementSibling == null && tip_card.previousElementSibling == null)
    location.reload();
  
  tip_card.remove();
}