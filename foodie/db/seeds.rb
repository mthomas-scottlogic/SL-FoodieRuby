# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data
[Email, Item, Order, Menu, User, Company].each(&:delete_all)

# Create default user
user = User.find_or_create_by!(email_address: 'user@example.com') do |u|
  u.name = 'user'
  u.role = 0  # default role
end

# Create sample companies
company1 = Company.find_or_create_by!(name: 'Pizza Palace') do |c|
  c.website = 'https://pizzapalace.com'
end

company2 = Company.find_or_create_by!(name: 'Sushi House') do |c|
  c.website = 'https://sushihouse.com'
end

# Create menus for companies
menu1 = Menu.find_or_create_by!(company_id: company1.id)
menu2 = Menu.find_or_create_by!(company_id: company2.id)

# Create orders first (before items that reference them)
order1 = Order.find_or_create_by!(user_id: user.id, company_id: company1.id) do |o|
  o.delivery_date = Date.tomorrow
  o.deadline_date = Date.today
end

order2 = Order.find_or_create_by!(user_id: user.id, company_id: company2.id) do |o|
  o.delivery_date = Date.tomorrow + 1.day
  o.deadline_date = Date.today
end

# Create items for menus
item1 = Item.find_or_create_by!(name: 'Margherita Pizza', menu_id: menu1.id, order_id: order1.id) do |i|
  i.description = 'Classic margherita pizza with fresh basil'
  i.price_amount = 12.99
  i.price_currency = 'USD'
end

item2 = Item.find_or_create_by!(name: 'California Roll', menu_id: menu2.id, order_id: order2.id) do |i|
  i.description = 'Fresh California roll with avocado and crab'
  i.price_amount = 8.99
  i.price_currency = 'USD'
end

# Create emails
email1 = Email.find_or_create_by!(company_id: company1.id) do |e|
  e.title = 'Welcome to Pizza Palace'
  e.body = 'Thank you for ordering from Pizza Palace!'
  e.recipients = ['user@example.com']
  e.menu_link = 'https://pizzapalace.com/menu'
end

email2 = Email.find_or_create_by!(company_id: company2.id) do |e|
  e.title = 'Welcome to Sushi House'
  e.body = 'Thank you for ordering from Sushi House!'
  e.recipients = ['user@example.com']
  e.menu_link = 'https://sushihouse.com/menu'
end

puts "✓ Database seeded successfully!"
puts "✓ Default user created: email='user@example.com', name='user'"
puts "✓ Created #{Company.count} companies"
puts "✓ Created #{Menu.count} menus"
puts "✓ Created #{Item.count} items"
puts "✓ Created #{Order.count} orders"
puts "✓ Created #{Email.count} emails"
