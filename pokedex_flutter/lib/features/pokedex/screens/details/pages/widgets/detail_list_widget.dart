import 'package:flutter/material.dart';
import 'package:pokedex_flutter/features/pokedex/screens/details/pages/widgets/detail_item_list_widget.dart';

import '../../../../../../common/models/pokemon.dart';

class DetailListWidget extends StatelessWidget {
  const DetailListWidget({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.controller,
    required this.onChangePokemon,
  }) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      pokemon.name,
                      style: const TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    '#${pokemon.num}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: PageView(
                onPageChanged: (index) => onChangePokemon(list[index]),
                controller: controller,
                children: list.map(
                  (e) {
                    bool diff = e.name != pokemon.name;
                    return DetailItemListWidget(isDiff: diff, pokemon: e);
                  },
                ).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
