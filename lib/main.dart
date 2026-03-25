import 'package:flutter/material.dart';
import 'package:w9_practice_firebase/data/repositories/songs/song_repository_firebase.dart';
import 'model/songs/song.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Needed if using Flutter

  final repo = SongRepositoryFirebase();

  try {
    final songs = await repo.fetchSongs();

    print('Fetched ${songs.length} songs:');
    for (var song in songs) {
      print(song);
    }
  } catch (e) {
    print('Error fetching songs: $e');
  }
}
