import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/constants.dart';
import 'package:flutter_pokedex/constants/ui_helper.dart';
import 'package:flutter_pokedex/widgets/poke_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/pokemon_model.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;

  const PokeListItem({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.w),
      ),
      elevation: 3,
      shadowColor: Colors.white,
      color: Colors.red.shade200,
      child: Padding(
        padding: UIHelper.getDefaultPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pokemon.name ?? 'N/A',
              style: Constants.getPokemonNameTextStyle(),
            ),
            Chip(
              label: Text(
                pokemon.type![0],
                style: Constants.getTypeChipTextStyle(),
              ),
            ),
            Expanded(child: PokeImageAndBall(pokemon: pokemon)),
          ],
        ),
      ),
    );
  }
}
