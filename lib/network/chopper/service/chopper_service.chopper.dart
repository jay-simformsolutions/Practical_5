// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chopper_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ChopperApiService extends ChopperApiService {
  _$ChopperApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ChopperApiService;

  @override
  Future<Response<dynamic>> getMovieList(String apiKey) {
    final Uri $url = Uri.parse('https://api.themoviedb.org/3/movie/upcoming');
    final Map<String, dynamic> $params = <String, dynamic>{'api_key': apiKey};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
