import 'package:dio/dio.dart';
import 'package:infofilm_app/service/dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMzk5MmRiYTNhY2ZmOGJmN2NiNzAzOTVlMTQyYWY4MSIsInN1YiI6IjYyZTU5ZjM4ZTg2MDE3MDA1ZjNlODUyZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UuuOgnSpV4um1H4QJPlPN-MX4O4xK2r9VWf5UzELT00',
        },
      ),
    );
  }
}

//   @override
//   Future<Response<T>> get<T>(
//     String path, {
//     Map<String, dynamic>? queryParameters,
//   }) {
//     return _dio.get<T>(
//       path,
//       queryParameters: queryParameters,
//     );
//   }
// }