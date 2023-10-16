import 'package:desafio_flutter_urbetrack/core/widgets/dfu_millennium_falcon_loading_indicator.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/character_list_component/bloc/character_list_bloc.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/character_presentation_card/presentation/character_presentation_card.dart';
import 'package:desafio_flutter_urbetrack/features/characters_list/presentation/components/search_bar/presentation/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterList extends StatelessWidget {
  final CharacterListBloc bloc;
  const CharacterList({required this.bloc, super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return BlocBuilder<CharacterListBloc, CharacterListState>(
      bloc: bloc..add(LoadInitialList()),
      builder: (context, state) {
        if (state is Loaded) {
          return Column(
            children: [
              CustomSearchBar(
                controller: controller,
                onFieldSubmitted: (value) {
                  bloc.add(Search(searchField: value));
                },
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: state.characters.length,
                  itemBuilder: (context, index) {
                    final lenght = state.characters.length;
                    if (lenght - index == 3 && !state.isLoadingMore) {
                      bloc.add(
                          LoadMoreCharacters(searchField: controller.text));
                    }
                    if (state.isLoadingMore && index == lenght - 1) {
                      return const Center(
                        child: DFUMillenniumFalcon(),
                      );
                    }
                    return CharacterPresentationCard(
                      character: state.characters[index],
                    );
                  },
                ),
              ),
            ],
          );
        }
        return Column(
          children: [
            CustomSearchBar(
                onFieldSubmitted: (value) {}, controller: controller),
            const Center(
              child: DFUMillenniumFalcon(),
            ),
          ],
        );
      },
    );
  }
}
