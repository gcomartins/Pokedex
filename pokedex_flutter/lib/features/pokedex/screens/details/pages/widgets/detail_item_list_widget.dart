import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/pokemon.dart';

class DetailItemListWidget extends StatelessWidget {
  const DetailItemListWidget({
    Key? key,
    required this.isDiff,
    required this.pokemon,
  }) : super(key: key);
  final bool isDiff;
  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: isDiff ? 0.4 : 1.0,
        child: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 200),
          curve: Curves.bounceInOut,
          tween: Tween<double>(
            end: isDiff ? 70 : 400,
            begin: isDiff ? 400 : 70,
          ),
          builder: (context, value, child) {
            return Image.network(
              pokemon.image,
              height: value,
              fit: BoxFit.fitWidth,
              color: isDiff ? Colors.black.withOpacity(0.2) : null,
            );
          },
        ),
      ),
    );
  }
}
