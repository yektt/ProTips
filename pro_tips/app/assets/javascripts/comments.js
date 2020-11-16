Comments = {};

Comments.buildComment = function(comment) {

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
  
  return commentBlockquote;
}

Comments.addComment = function(comment) {
  var newComment, comments;

  newComment = Comments.buildComment(comment);
  var comments = document.getElementById('commentList');

  if (comments == null)
  {
    var commentArea = document.getElementById('comments');
    var h3 = document.createElement('h3');
    h3.appendChild(document.createTextNode('Comments'));
    var div = document.createElement('div');
    div.className = 'm-3';
    div.id = 'commentList';

    commentArea.insertBefore(div, commentArea.firstChild);
    commentArea.insertBefore(h3, commentArea.firstChild);
    div.appendChild(newComment);
    document.getElementById('no_comments').remove();
  }
  else
  {
    comments = document.getElementById('commentList');
    comments.appendChild(newComment);
  }
}
