import 'package:dio/dio.dart';
import '../models/game.dart';

class GameApiService {
  final Dio _dio = Dio();

  Future<List<Game>> fetchGames() async {
    try {
      final response = await _dio.get(
        'https://67bcd30ded4861e07b3c0613.mockapi.io/games',
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );

      if (response.data is List) {
        final allGames = <Game>[];
        for (final item in response.data as List) {
          if (item is Map && item.containsKey('game_catalog')) {
            final games = item['game_catalog'] as List;
            allGames.addAll(games.map((json) => Game.fromJson(json)));
          }
        }
        return allGames;
      }

      throw Exception('Unexpected API response format');
    } on DioException catch (e) {
      print('Dio Error: ${e.response?.data}');
      throw Exception('Failed to load games: ${e.message}');
    } catch (e) {
      print('General Error: $e');
      throw Exception('Failed to load games: $e');
    }
  }
}