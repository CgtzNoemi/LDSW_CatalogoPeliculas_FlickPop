class Pelicula {
  String id;
  String titulo;
  String director;
  int anio;
  String duracion;
  String genero;
  String sinopsis;
  String imagenUrl;

  Pelicula({
    required this.id,
    required this.titulo,
    required this.director,
    required this.anio,
    required this.duracion,
    required this.genero,
    required this.sinopsis,
    required this.imagenUrl,
  });
}

List<Pelicula> listOfPeliculas(){
  return [
      Pelicula(
        id: '1',
        titulo:"En busca de la felicidad",
        director: 'Gabriele Muccino',
        anio: 2006,
        duracion: '1h 57m',
        genero: 'Drama',
        sinopsis: 'La vida es una lucha para Chris Gardner. Expulsado de su apartamento, él y su joven hijo se encuentran solos sin ningún lugar a donde ir. A pesar de que Chris eventualmente consigue trabajo como interno en una prestigiada firma financiera, la posición no le da dinero. El dúo debe vivir en un albergue y enfrentar muchas dificultades, pero Chris no se da por vencido y lucha por conseguir una vida mejor para él y su hijo.',
        imagenUrl:'1681438361_6438b6990ffcc.jpeg',
      ),
      Pelicula(
        id: '2',
        titulo:"El laberinto",
        director: 'Jim Henson',
        anio: 1986,
        duracion: '1h 41m',
        genero: 'Fantasía|Musical',
        sinopsis: 'Sarah, en un momento de desesperación, desea que su hermano sea secuestrado por los Goblins, y su deseo se hace realidad. Para recuperarlo, Sarah entra en el laberinto, donde los cuentos de hadas son tan reales como la vida misma.',
        imagenUrl:'1681438035_6438b553d31cf.jpeg',
      ),
      Pelicula(
        id: '3',
        titulo:"El efecto mariposa",
        director: 'J. Mackye Gruber/Eric Bress',
        anio: 2004,
        duracion: '2 horas',
        genero: 'Ciencia ficción|Drama|Suspenso|Psicológico​',
        sinopsis: 'Evan Treborn es un joven que se está esforzando por superar unos dolorosos recuerdos de su infancia. Un día descubre una técnica que le permite viajar atrás en el tiempo para poder cambiar el curso de su traumática historia. Sin embargo, también descubre que cualquier mínimo cambio en el pasado puede traer grandes cambios a su futuro.',
        imagenUrl:'1681438376_6438b6a8d0096.jpeg',
      ),
      Pelicula(
        id: '4',
        titulo:"Your name",
        director: 'Gabriele Muccino',
        anio: 2016,
        duracion: '1h 47m',
        genero: 'Drama|Fantasía',
        sinopsis: 'Mitsuha es una adolescente que detesta su vida rural en el campo. Por otro lado, Taki es un chico que vive en Tokio y sueña con ser un artista o un arquitecto. Los destinos de estos jóvenes se entrelazan la noche en que dos estrellas caen del cielo, y comienzan a intercambiar sus cuerpos de la noche a la mañana. Con el pasar del tiempo, desarrollan maneras de comunicarse entre ellos y un creciente anhelo de conocerse en persona.',
        imagenUrl:'1681438308_6438b66475203.jpeg',
      ),
  ];
}
