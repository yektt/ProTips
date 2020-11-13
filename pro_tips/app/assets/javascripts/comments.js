Comments = {};

Comments.displayComment = function(comment) {
  
  var commentParagraph = document.createElement('p');
  commentParagraph.className = 'mb-0';
  commentParagraph.appendChild(document.createTextNode(comment.body));

  var commenterAvatar = document.createElement('img');
  commenterAvatar.className = 'avatar-xs';
  commenterAvatar.src = comment.commenter_avatar;
  commenterAvatar.alt = comment.commenter;

  var commentLink = document.createElement('a');
  commentLink.href = comment.link;
  commentLink.appendChild(commenterAvatar);
  commentLink.appendChild(document.createTextNode(" " + comment.commenter));

  var commentFooter = document.createElement('footer');
  commentFooter.className = 'blockquote-footer';
  commentFooter.appendChild(document.createTextNode('Added by '));
  commentFooter.appendChild(commentLink);
  commentFooter.appendChild(document.createTextNode(' on ' + comment.time));

  var commentBlockquote = document.createElement('blockquote');
  commentBlockquote.className = 'blockquote';
  commentBlockquote.appendChild(commentParagraph);
  commentBlockquote.appendChild(commentFooter);
}

Comments.addComment = function(comment) {
  var newComment, comments;

  newComment = Comments.displayComment(comment);
  comments = document.getElementById('commentList');
  comments.insertBefore(newComment, comments.lastChild);
}
