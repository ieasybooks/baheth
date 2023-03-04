User.find_or_create_by( # user =
  first_name: 'مدير',
  last_name: 'النظام',
  email: 'baheth@ieasybooks.com',
  admin: true
) do |user|
  user.password = 'baheth@ieasybooks.com'
end
