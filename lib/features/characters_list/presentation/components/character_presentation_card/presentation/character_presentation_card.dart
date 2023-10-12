import 'package:desafio_flutter_urbetrack/core/entities/character.dart';
import 'package:flutter/material.dart';

class CharacterPresentationCard extends StatelessWidget {
  final Character character;
  const CharacterPresentationCard({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(character.name),
        subtitle: Text('Género: ${character.gender}'),
        onTap: () {
        },
      ),
    );
  }
}
