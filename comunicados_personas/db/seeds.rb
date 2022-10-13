# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

personas = Persona.create!([
    {nombre: "Manuel", fecha_nacimiento: Date.new(1987, 2, 14)},
    {nombre: "Ana", fecha_nacimiento: Date.new(2000, 1, 7)},
    {nombre: "Francisco", fecha_nacimiento: Date.new(2005, 11, 20)},
    {nombre: "Jaime", fecha_nacimiento: Date.new(2008, 5, 11)},
    {nombre: "Luisa", fecha_nacimiento: Date.new(1992, 8, 01)},
    {nombre: "Jose", fecha_nacimiento: Date.new(1996, 10, 29)},
    {nombre: "Emilia", fecha_nacimiento: Date.new(2010, 7, 18)},
    {nombre: "Mauricio", fecha_nacimiento: Date.new(2007, 12, 23)},
    {nombre: "Gema", fecha_nacimiento: Date.new(2012, 2, 6)},
    {nombre: "Silvia", fecha_nacimiento: Date.new(1998, 2, 3)}
])

com1 = Comunicado.create!(creador_id: personas[0], receptor_id: personas[2], asunto: 'Esto es un asunto entre Manuel y Francisco', contenido: 'Contenido de Manuel y Francisco', comunicado_anterior_id: nil)
com2 = Comunicado.create!(creador_id: personas[2], receptor_id: personas[0], asunto: "Esto es el asunto entre Francisco y Manuel sin resolver", contenido: "Respuesta de Francisco a Manuel", comunicado_anterior_id: com1.id)
com3 = Comunicado.create!(creador_id: personas[1], receptor_id: personas[4], asunto: "Esto es un asunto entre Ana y Luisa", contenido: "Contenido de Ana a Luisa", comunicado_anterior_id: nil)
com4 = Comunicado.create!(creador_id: personas[7], receptor_id: personas[2], asunto: "Esto es un asunto entre Mauricio y Francisco", contenido: "Contenido de Mauricio a Francisco", comunicado_anterior_id: nil)
com5 = Comunicado.create!(creador_id: personas[8], receptor_id: personas[5], asunto: "Esto es un asunto entre Gema y Jose", contenido: "Contenido de Gema a Jose", comunicado_anterior_id: nil)
com6 = Comunicado.create!(creador_id: personas[5], receptor_id: personas[8], asunto: "Esto es el asunto entre Jose y Gema sin resolver", contenido: "Respuesta de Jose a Gema", comunicado_anterior_id: com5.id)
com7 = Comunicado.create!(creador_id: personas[4], receptor_id: personas[6], asunto: "Esto es un asunto entre Luisa y Emilia", contenido: "Contenido de Luisa a Emilia", comunicado_anterior_id: nil)
com8 = Comunicado.create!(creador_id: personas[0], receptor_id: personas[7], asunto: "Esto es un asunto entre Manuel y Mauricio", contenido: "Contenido de Manuel y Mauricio", comunicado_anterior_id: nil)
com9 = Comunicado.create!(creador_id: personas[6], receptor_id: personas[9], asunto: "Esto es un asunto entre Emilia y Silvia", contenido: "Contenido de Emilia y Silvia", comunicado_anterior_id: nil)
com10 = Comunicado.create!(creador_id: personas[8], receptor_id: personas[5], asunto: "Re: Gema a Jose", contenido: "Respuesta de Gema a Jose", comunicado_anterior_id: com6.id)

adjuntos = Adjunto.create!([
    {comunicado: com1},
    {comunicado: com1},
    {comunicado: com2},
    {comunicado: com4},
    {comunicado: com2},
    {comunicado: com3},
    {comunicado: com4},
    {comunicado: com5},
    {comunicado: com1},
    {comunicado: com4},
    {comunicado: com1},
    {comunicado: com1}
])