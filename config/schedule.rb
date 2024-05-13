every :day, at: '12:00 am' do
  runner "Post.where('created_at < ?', 1.year.ago).destroy_all"
end