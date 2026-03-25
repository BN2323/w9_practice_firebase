import 'package:flutter/widgets.dart';
import 'package:w9_practice_firebase/model/songs/rich_song.dart';

import '../../model/songs/song.dart';

class PlayerState extends ChangeNotifier {
  RichSong? _currentSong;

  RichSong? get currentSong => _currentSong;

  void start(RichSong song) {
    _currentSong = song;

    notifyListeners();
  }

  void stop() {
    _currentSong = null;

    notifyListeners();
  }
}
