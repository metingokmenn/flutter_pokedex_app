// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';
import 'package:flutter_pokedex/services/pokedex_api.dart';
import 'package:flutter_pokedex/widgets/pokelist_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonListFuture;
  @override
  void initState() {
    _pokemonListFuture = PokeApi.getPokemonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Pokemon list build çalıştı');
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> _pokemonList = snapshot.data!;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    ScreenUtil().orientation == Orientation.portrait ? 2 : 3),
            itemBuilder: (context, index) {
              debugPrint('pokemon item builder çalıştı');
              return PokeListItem(pokemon: _pokemonList[index]);
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Hata çıktı'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
