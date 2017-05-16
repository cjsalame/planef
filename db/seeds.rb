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

g00 = Grade.new(
  name: '1° Basico'
)
g00.save!
g01 = Grade.new(
  name: '2° Basico'
)
g01.save!
g02 = Grade.new(
  name: '3° Basico'
)
g02.save!
g03 = Grade.new(
  name: '4° Basico'
)
g03.save!
g04 = Grade.new(
  name: '5° Basico'
)
g04.save!
g05 = Grade.new(
  name: '6° Basico'
)
g05.save!
g06 = Grade.new(
  name: '7° Basico'
)
g06.save!
g07 = Grade.new(
  name: '8° Basico'
)
g07.save!
g08 = Grade.new(
  name: 'I Medio'
)
g08.save!
g09 = Grade.new(
  name: 'II Medio'
)
g09.save!
g10 = Grade.new(
  name: 'III Medio'
)
g10.save!
g11 = Grade.new(
  name: 'IV Medio'
)
g11.save!
