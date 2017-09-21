div.row
  div.col-sm-11
    h2 Users
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/users/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th First_name
        th Last_name
        th Age
        th Height
        th Actions
    tbody
    - users.each do |user|
      tr
        td = user.first_name
        td = user.last_name
        td = user.age
        td = user.height
        td
          span
            a.btn.btn-primary.btn-xs href="/users/#{ user.id }" read
            a.btn.btn-success.btn-xs href="/users/#{ user.id }/edit" edit
            a.btn.btn-danger.btn-xs href="/users/#{ user.id }?_method=delete" onclick="return confirm('Are you sure?');" delete

