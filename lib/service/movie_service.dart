
import 'package:dio/dio.dart';

import 'package:riverspods/constants/common.dart';
import 'package:riverspods/models/movie.dart';





class MovieService {

static final dio = Dio();

 static Future<List<Movie>> getPopularMovieData({required String apiPath}) async{
      try{
        final response = await dio.get(apiPath,
         options: Options(
            headers: credential
         )
        );

        return  (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();

      }on DioException catch (err){
         throw '${err.response}';
      }
  }



}