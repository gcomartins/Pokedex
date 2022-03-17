import 'package:flutter/material.dart';

class DetailAppBarWidget extends StatelessWidget {
  const DetailAppBarWidget({
    Key? key,
    required this.pokemon,
    required this.onBack,
    required this.isOnTop,
  }) : super(key: key);
  final pokemon;
  final VoidCallback onBack;
  final bool isOnTop;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        pinned: true,
        elevation: 0,
        backgroundColor: pokemon.baseColor,
        leading: IconButton(
          onPressed: onBack,
          icon: const Icon(
            Icons.chevron_left,
          ),
        ),
        centerTitle: false,
        title: AnimatedOpacity(
          duration: Duration(milliseconds: 200),
          opacity: isOnTop ? 0 : 1,
          child: Text(
            pokemon.name,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ));
  }
}
