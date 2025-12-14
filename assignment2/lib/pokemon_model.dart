// lib/pokemon_model.dart

class Pokemon {
  final String name;
  final String imagePath;

  Pokemon({required this.name, required this.imagePath});
}

final List<Pokemon> pokemonList = [
  Pokemon(name: 'Bulbasaur', imagePath: 'assets/images/m1.jpg'),
  Pokemon(name: 'Ivysaur', imagePath: 'assets/images/m2.jpg'),
  Pokemon(name: 'Venusaur', imagePath: 'assets/images/m3.jpg'),
  Pokemon(name: 'Charmander', imagePath: 'assets/images/m4.jpg'),
  Pokemon(name: 'Charmeleon', imagePath: 'assets/images/m5.jpg'),
  Pokemon(name: 'Charizard', imagePath: 'assets/images/m6.jpg'),
];