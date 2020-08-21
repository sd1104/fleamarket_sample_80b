$(function(){
  function buildHTML(comment){
    let html = `<div class="comment_user">
                  <a class="comment_user" href="/users/${comment.user_id}">${comment.user_name}</a>
                </div>
                <div class="comment_text">
                  ${comment.text}
                </div>`
    return html;
  }
  $('.commentFormbtn').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.comments').prepend(html);
      $('.comment-Form').val('');
      $('.comment-submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});