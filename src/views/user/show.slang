p = user.first_name
p = user.last_name
p = user.age
p = user.height
p
  a.btn.btn-default.btn-xs href="/users" back
  a.btn.btn-success.btn-xs href="/users/#{ user.id }/edit" edit
  a.btn.btn-danger.btn-xs href="/users/#{ user.id }?_method=delete" onclick="return confirm('Are you sure?');" delete
