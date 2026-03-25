String formatDuration(Duration duration) {
  final minutes = duration.inMinutes;
  final seconds = duration.inSeconds % 60;
  final secondsStr = seconds.toString().padLeft(2, '0');
  return '$minutes:$secondsStr';
}
