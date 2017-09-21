- if changeset.errors
  ul.errors
  - changeset.errors.each do |error|
    li = error.to_s

== form(action: "/users/#{user.id.to_s}", method: user.id ? :patch : :post) do
  == csrf_tag
  div.form-group
  == text_field(name: "first_name", value: user.first_name, placeholder: "First_name", class: "form-control")
  div.form-group
  == text_field(name: "last_name", value: user.last_name, placeholder: "Last_name", class: "form-control")
  div.form-group
  == text_field(name: "age", value: user.age, placeholder: "Age", class: "form-control")
  div.form-group
  == text_field(name: "height", value: user.height, placeholder: "Height", class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/users", class: "btn btn-default btn-xs")
