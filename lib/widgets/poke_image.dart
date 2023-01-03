import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';

class PokeImageAndBall extends StatelessWidget {
  final PokemonModel pokemon;

  const PokeImageAndBall({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = 'assets/images/pokeball.png';
    return Stack(
      children: [
        Image.asset(pokeballImageUrl),
        CachedNetworkImage(imageUrl: pokemon.img!)
      ],
    );
  }
}
