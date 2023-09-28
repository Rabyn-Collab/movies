import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverspods/providers/movie_provider.dart';




class TabBarWidgets extends StatelessWidget {
  const TabBarWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, child) {
          final data = ref.watch(moviePopular);
          return  data.when(
              data: (data){
                return GridView.builder(
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
                );
              },
              error: (err,stack) => Center(child: Text('$err')),
              loading: () => Center(child: CircularProgressIndicator())
          );
        }
    );
  }
}
