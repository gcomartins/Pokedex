import 'package:flutter/material.dart';

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
    return Positioned(
      height: 350,
      top: 80,
      left: 0,
      right: 0,
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              height: 250,
              child: PageView(
                onPageChanged: (index) => onChangePokemon(list[index]),
                controller: controller,
                children: list.map((e) {
                  bool diff = e.name != pokemon.name;
                  return AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: diff ? 0.4 : 1.0,
                    child: TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.bounceInOut,
                      tween: Tween<double>(
                        end: diff ? 70 : 400,
                        begin: diff ? 400 : 70,
                      ),
                      builder: (context, value, child) {
                        return Center(
                          child: Image.network(
                            e.image,
                            height: value,
                            fit: BoxFit.fitWidth,
                            color: diff ? Colors.black.withOpacity(0.2) : null,
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
