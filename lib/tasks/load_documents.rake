namespace :load do
  task documents: :environment do

    SITE_ID = Site.find_by(code: 'es').id

    CONTENIDO = "“Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit…”
“No hay nadie que ame el dolor mismo, que lo busque, lo encuentre y lo quiera, simplemente porque es el dolor.”

¿Qué es Lorem Ipsum?
Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas “Letraset”, las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum."

    DESCRIPTIONS = [
      'Ser Vegano promueve la abolición del uso de los animales en todas sus formas, mediante educación vegana no violenta y creativa.',
      'Ser vegano es muy fácil. Lo único que tenés que hacer es discontinuar el consumo de productos animales, incluyendo lo que comés, vestís y usás.',
      'Ser Vegano defiende el enfoque Abolicionista a los Derechos de los Animales'
    ]


    ['page', 'article', 'recipe', 'resource'].each do |kind|
      10.times do |i|
        puts "#{kind} - #{i}"
        d = Document.create(
          title:        "#{kind} - #{i}",
          slug:         "#{kind}-#{i}",
          description:  DESCRIPTIONS.sample,
          content:      CONTENIDO,
          site_id:      SITE_ID,
          kind:         kind,
          protected: false,
          public: true
        )
        #binding.pry
        #puts d.errors.full_message
      end
    end
  end
end