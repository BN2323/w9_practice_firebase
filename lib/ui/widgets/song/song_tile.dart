import 'package:flutter/material.dart';
import 'package:w9_practice_firebase/model/songs/rich_song.dart';
import 'package:w9_practice_firebase/ui/utils/format_duration.dart';

import '../../../model/songs/song.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
  });

  final RichSong song;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            onTap: onTap,
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(song.imageUrl),
            ),
            title: Text(song.title),
            subtitle: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.grey[700], fontSize: 14),
                children: [
                  TextSpan(
                    text: "${formatDuration(song.duration)} mins  ",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(text: "${song.artistName} - ${song.artistGenre}"),
                ],
              ),
            ),
            trailing: Text(
              isPlaying ? "Playing" : "",
              style: TextStyle(color: Colors.amber),
            ),
          ),
        ),
      ),
    );
  }
}
