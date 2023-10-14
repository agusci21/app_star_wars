import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/character_list_component/bloc/character_list_bloc.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/character_presentation_card/presentation/character_presentation_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterList extends StatelessWidget {
  final CharacterListBloc bloc;
  const CharacterList({required this.bloc, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterListBloc, CharacterListState>(
      bloc: bloc..add(LoadInitialList()),
      builder: (context, state) {
        if (state is Loaded) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: state.characters.length,
              itemBuilder: (context, index) {
                final lenght = state.characters.length;
                if (lenght - index == 3) {
                  bloc.add(LoadMoreCharacters());
                }
                return CharacterPresentationCard(
                  character: state.characters[index],
                );
              },
            ),
          );
        }
        if (state is LoadingMore) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: state.characters.length,
              itemBuilder: (context, index) {
                if (state.characters.length - index == 1) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CharacterPresentationCard(
                    character: state.characters[index]);
              },
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
