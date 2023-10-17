import 'package:desafio_flutter_urbetrack/application/localizations/i18n.dart';
import 'package:desafio_flutter_urbetrack/core/entities/character.dart';
import 'package:desafio_flutter_urbetrack/core/helpers/gender_helper.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/character_list_module.dart';
import 'package:flutter/material.dart';

class CharacterPresentationCard extends StatefulWidget {
  final Character character;
  final Duration duration;
  const CharacterPresentationCard({
    required this.character,
    this.duration = const Duration(milliseconds: 600),
    super.key,
  });

  @override
  State<CharacterPresentationCard> createState() =>
      _CharacterPresentationCardState();
}

class _CharacterPresentationCardState extends State<CharacterPresentationCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    animation = Tween<double>(begin: 150, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    _controller.forward();
  }

  @override
  void didUpdateWidget(CharacterPresentationCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.duration = widget.duration;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(animation.value, 0),
          child: child,
        );
      },
      animation: animation,
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: const Icon(Icons.person),
          title: Text(widget.character.name),
          subtitle: Text(
              '${I18n.of(context).translate('gender')}: ${GenderHelper.getTranslatedGender(context, widget.character.gender)}'),
          onTap: () {
            CharacterListModule.navigateToCharactersDetailsList(context,
                character: widget.character);
          },
        ),
      ),
    );
  }
}
