import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverspods/models/movie.dart';
import 'package:riverspods/providers/movie_provider.dart';




class TabBarWidgets extends StatelessWidget {
  final FutureProvider  getMovie;
  final String pageKey;
  const TabBarWidgets({super.key, required this.getMovie, required this.pageKey});

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, child) {
          final data = ref.watch(getMovie);
          return  data.when(
              data: (data){
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    key: PageStorageKey<String>(pageKey),
                      itemCount: data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        childAspectRatio: 2/3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5
                      ),
                      itemBuilder: (context, index){

                        return Image.network(data[index].poster_path);
                      }
                  ),
                );
              },
              error: (err,stack) => Center(child: Text('$err')),
              loading: () => Center(child: CircularProgressIndicator())
          );
        }
    );
  }
}
