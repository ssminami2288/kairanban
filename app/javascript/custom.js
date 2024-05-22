// app/assets/javascripts/custom.js

document.addEventListener('DOMContentLoaded', function() {
  var form = document.querySelector('form');

  form.addEventListener('submit', function(event) {
    event.preventDefault();
    var formData = new FormData(form);
    fetch(form.action, {
      method: form.method,
      body: formData
    }).then(function(response) {
      if (response.ok) {
        window.location.href = response.url;
      } else {
        alert('更新に失敗しました。');
      }
    }).catch(function(error) {
      alert('エラーが発生しました。');
    });
  });
});
