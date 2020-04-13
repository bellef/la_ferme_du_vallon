begin
  puts('Cleaning database...')
  Admin.destroy_all
  Product.destroy_all
  Category.destroy_all
  puts('DONE')

  puts('Creating users...')
  Admin.create!(email: 'admin@admin.com', password: 'qwertyuiop')
  puts('DONE')

  puts('Creating categories...')
  vegetables = Category.create!(title: 'Légumes', position: 1)
  processed_goods = Category.create!(title: 'Produits transformés', position: 2)
  puts('DONE')

  puts('Creating products...')
  p1 = Product.create(title: 'Carottes', description: 'Les belles carottes de la ferme', price: 3.50, packaging: 'Botte de 1kg', categories: [vegetables])
  p1.picture.attach(io: File.open(Rails.root.join('db/seeds/images/carrots.jpg')), filename: 'carrots.jpg')
  p2 = Product.create(title: 'Radis', description: 'Radis en botte', price: 2.50, packaging: 'Botte de 300g', categories: [vegetables])
  p2.picture.attach(io: File.open(Rails.root.join('db/seeds/images/radish.jpg')), filename: 'radish.jpg')
  p3 = Product.create(title: 'Patates', description: 'Les belles patates de la ferme', price: 4.50, packaging: 'Sac de 2,5kg', categories: [vegetables])
  p3.picture.attach(io: File.open(Rails.root.join('db/seeds/images/potatoes.jpg')), filename: 'potatoes.jpg')
  p4 = Product.create(title: 'Farine de petit épeautre', description: 'Farine de petit épeautre de Haute Provence', price: 3.50, packaging: '1kg', categories: [processed_goods])
  p4.picture.attach(io: File.open(Rails.root.join('db/seeds/images/flour.jpg')), filename: 'flour.jpg')
  p5 = Product.create(title: 'Farine de petit épeautre', description: 'Farine de petit épeautre de Haute Provence', price: 6.50, packaging: '2kg', categories: [processed_goods])
  p5.picture.attach(io: File.open(Rails.root.join('db/seeds/images/flour.jpg')), filename: 'flour.jpg')
  p6 = Product.create(title: 'Jambon cru', description: 'Jambon cru maison, affiné à la ferme', price: 6.50, packaging: '200g', categories: [processed_goods])
  p6.picture.attach(io: File.open(Rails.root.join('db/seeds/images/ham.jpg')), filename: 'ham.jpg')
  p7 = Product.create(title: 'Purée de carottes', description: 'De la bonne purée maison', price: 5, packaging: '1L', categories: [vegetables, processed_goods])
  p7.picture.attach(io: File.open(Rails.root.join('db/seeds/images/carrots.jpg')), filename: 'carrots.jpg')
  puts('DONE')
rescue ActiveRecord::RecordInvalid => e
  p e.record.errors.full_messages
end
