# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' },
# { name: 'Lord of the Rings' }])
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
  user_id:               j0.id
)

j0.schools << School.new(
  name:                  'Pumahue',
  RBD:                   '8437592',
  address:               'Av. Quilin 8200',
  phone:                 '2222222',
  user_id:               j0.id
)

j0.schools << School.new(
  name:                  'Antupiren',
  RBD:                   '809809',
  address:               'Av. Antupiren 6969',
  phone:                 '444444444',
  user_id:               j0.id
)

j0.schools.first.subjects << Subject.new(
  name: 'Matemáticas'
)
j0.schools.first.subjects << Subject.new(
  name: 'Lenguaje'
)
j0.schools.first.subjects << Subject.new(
  name: 'Ciencias Naturales'
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


ea1 = ExpectedLearning.new(
  subject:                 'Ciencias Naturales',
  grade:               '3° Basico',
  description:           'OA_1: Observar y describir, por medio'\
                         ' de la investigación experimental,'\
                         ' las necesidades de las plantas y'\
                         ' su relación con la raíz, el tallo y las hojas.'
)
ea1.save!

ea2 = ExpectedLearning.new(
  subject:                 'Ciencias Naturales',
  grade:               '3° Basico',
  description:           'OA_2: Observar, registrar e identificar'\
                         ' variadas plantas de nuestro país, incluyendo'\
                         ' vegetales autóctonos y cultivos principales'\
                         ' a nivel nacional y regional.'
)
ea2.save!

ea3 = ExpectedLearning.new(
  subject:                 'Ciencias Naturales',
  grade:               '3° Basico',
  description:           'OA_3: Observar y describir algunos cambios'\
                         ' de las plantas con flor durante su ciclo'\
                         ' de vida (germinación, crecimiento,'\
                         ' reproducción, formación de la flor y del'\
                         ' fruto), reconociendo la importancia de la'\
                         ' polinización y de la dispersión de la semilla.'
)
ea3.save!

ea4 = ExpectedLearning.new(
  subject:                 'Ciencias Naturales',
  grade:               '3° Basico',
  description:           'OA_4: Describir la importancia de las plantas'\
                         ' para los seres vivos, el ser humano y el'\
                         ' medio-ambiente (por ejemplo: alimentación,'\
                         ' aire para respirar, productos derivados,'\
                         ' ornamentación, uso medicinal) proponiendo'\
                         ' y comunicando medidas de cuidado.' 
)
ea4.save!

ea5 = ExpectedLearning.new(
  subject:                 'Ciencias Naturales',
  grade:               '3° Basico',
  description:           'OA_5: Explicar la importancia de usar'\
                         ' adecuadamente los recursos, proponiendo'\
                         ' acciones y construyendo instrumentos'\
                         ' tecnológicos para reutilizarlos,'\
                         ' reducirlos y reciclarlos en la casa y en'\
                         'la escuela.'  
)
ea5.save!

ea6 = ExpectedLearning.new(
  subject:                 'Ciencias Naturales',
  grade:               '3° Basico',
  description:           'OA_6: Clasificar los alimentos, distinguiendo'\
                         ' sus efectos sobre la salud y proponer'\
                         ' hábitos alimenticios saludables.'  
)
ea6.save!

ea7 = ExpectedLearning.new(
  subject:                 'Ciencias Naturales',
  grade:               '3° Basico',
  description:           'OA_7: Proponer, comunicar y ejercitar buenas'\
                         ' prácticas de higiene en la manipulación'\
                         ' de alimentos para prevenir enfermedades.'  
)
ea7.save!

ea8 = ExpectedLearning.new(
  subject: 'Matemáticas',
  grade: '4° Basico',
  description: 'OA_13: Identificar y describir patrones numéricos'\
                ' en tablas que involucren una operación, de manera'\
                ' manual y/o usando software educativo.'
)
ea8.save!

ea9 = ExpectedLearning.new(
  subject: 'Matemáticas',
  grade: '4° Basico',
  description: 'OA_14: Resolver ecuaciones e inecuaciones de un paso'\
               ' que involucren adiciones y sustracciones, comprobando'\
               ' los resultados en forma pictórica y simbólica del 0 al 100'\
               ' y aplicando las relaciones inversas entre la adición y la'\
               ' sustracción.'
)
ea9.save!
