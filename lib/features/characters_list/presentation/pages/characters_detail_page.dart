import 'package:desafio_flutter_urbetrack/application/localizations/i18n.dart';
import 'package:flutter/material.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(I18n.of(context).translate('character_details')),
      ),
    );
  }
}
