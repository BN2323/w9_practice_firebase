import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:w9_practice_firebase/data/dtos/artist_dto.dart';
import 'package:w9_practice_firebase/data/repositories/artists/artist_repository.dart';
import 'package:w9_practice_firebase/model/artists/artist.dart';

class ArtistRepositoryFirebase extends ArtistRepository {
  final Uri artistsUri = Uri.https(
    'week-8-34ffb-default-rtdb.asia-southeast1.firebasedatabase.app',
    '/artists.json',
  );

  @override
  Future<List<Artist>> fetchArtists() async {
    final response = await http.get(artistsUri);

    if (response.statusCode == 200) {
      final Map<String, dynamic>? map =
          json.decode(response.body) as Map<String, dynamic>?;

      if (map == null) return [];

      return map.entries.map((entry) {
        final String id = entry.key;
        final Map<String, dynamic> data = Map<String, dynamic>.from(
          entry.value,
        );
        return ArtistDto.fromJson(id, data);
      }).toList();
    } else {
      throw Exception('Failed to load artists');
    }
  }
}
