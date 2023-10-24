import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilx/application/search/search_bloc.dart';
import 'package:netfilx/core/constants.dart';
import 'package:netfilx/presentation/widgets/main_title.dart';
import 'package:netfilx/presentation/widgets/main_card.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Movies & TV'),
        kHeightLarge,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  shrinkWrap: true,
                  childAspectRatio: 1 / 1.5,
                  children: List.generate(state.searchDataList.length, (index) {
                    final movie = state.searchDataList[index];
                    return MainCard(
                      imageUrl: movie.posterPath,
                    );
                  }));
            },
          ),
        ),
      ],
    );
  }
}
