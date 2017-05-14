# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p0 = User.new(
  name:                  'Carlos',
  lastname:              'Salame',
  dob:                   '1993-01-20',
  phone:                 '56979571136',
  email:                 'cjsalame@uc.cl',
  password:              '123123',
  password_confirmation: '123123',
  role:                  'Profesor'
)
p0.save!

j0 = User.new(
  name:                  'Tulio',
  lastname:              'Triviño',
  dob:                   '2000-04-20',
  phone:                 '56931313131',
  email:                 'tulio@31minutos.cl',
  password:              '123123',
  password_confirmation: '123123',
  role:                  'Jefe UTP'
)
j0.save!

j0.schools << School.new(
  name:                  'Teresiano Enrique de Ossó',
  RBD:                   '789789',
  address:               'Av. Ossa 4545',
  phone:                 '987987',
  user_id:               1
)

j0.schools << School.new(
  name:                  'Pumahue',
  RBD:                   '8437592',
  address:               'Av. Quilin 8200',
  phone:                 '2222222'
)

j0.schools << School.new(
  name:                  'Antupiren',
  RBD:                   '809809',
  address:               'Av. Antupiren 6969',
  phone:                 '444444444'
)
