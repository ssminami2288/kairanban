function addStamp(postId) {
  fetch('/stamps', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
    },
    body: JSON.stringify({ stamp: { post_id: postId } }),
  })
  .then(response => response.json())
  .then(data => {
    if (data.notice) {
      alert(data.notice);
      location.reload();
    } else {
      alert(data.alert);
    }
  });
}