import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverspods/service/movie_service.dart';







final moviePopular = FutureProvider((ref) => MovieService.getPopularMovieData());
