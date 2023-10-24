import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netfilx/application/search/search_bloc.dart';
import 'package:netfilx/core/constants.dart';
import 'package:netfilx/domain/core/debounce/debounce.dart';
import 'package:netfilx/presentation/search/widgets/search_idle.dart';
import 'package:netfilx/presentation/search/widgets/search_view.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({Key? key}) : super(key: key);
  final _debounce = Debouncer(milliseconds: 1 * 500);
  String? searchData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoSearchTextField(
            backgroundColor: Colors.grey.shade900,
            style: const TextStyle(color: kWhiteColor),
            prefixIcon: Icon(
              CupertinoIcons.search,
              color: Colors.grey.shade700,
            ),
            suffixIcon: Icon(
              CupertinoIcons.xmark_circle_fill,
              color: Colors.grey.shade700,
            ),
            onChanged: (query) {
              searchData = query;
              if (query.isEmpty) {
                BlocProvider.of<SearchBloc>(context)
                    .add(const SearchEvent.initialize());
              }
              _debounce.run(() {  
                if (query.isNotEmpty) {
                  BlocProvider.of<SearchBloc>(context)
                      .add(SearchEvent.searchMovie(movieQuery: query));         
                }           
              });

              //_debounce.dispose();
            },
          ),
          kHeight,
          Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.searchDataList.isEmpty) {
                return const SearchIdle();
               }
              // else if (state.searchDataList.isEmpty ) {
              //   return const Center(
              //     child: Text('No Search Data'),    
              //   );
              // } 
              else if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const SearchView();
              }
            },
            buildWhen: ((previous, current) {
              if ((previous.searchDataList.isEmpty &&
                      current.searchDataList.isNotEmpty) ||
                  (previous.isLoading && !current.isLoading)) {
                return true;
              }
              return false;
            }),
          )),
        ],
      ),
    );
  }
}
