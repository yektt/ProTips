Users = {};

Users.removeUser = function (userId) {
  document.getElementById("user-" + userId).parentElement.remove();
};