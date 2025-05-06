import 'package:youtube_explode_dart/youtube_explode_dart.dart';

Future<void> main() async {
  final yt = YoutubeExplode();

  // Get the video metadata.
  //final video = await yt.videos.get('UGzI-ABpy6k');
  //print(video.title); // ^ You can pass both video URLs or video IDs.

  final manifest = await yt.videos.streams.getManifest('6BGmX2W6ano');

  // Print all the available streams.
  print(manifest);

  // Get the audio streams.
  //final audio = manifest.audioOnly;

  // Download it
  //final stream = yt.videos.streams.get(audio.first);
  // then pipe the stream to a file...
  print("bestQuality= ${manifest.muxed.bestQuality}");
  // Or you can use the url to stream it directly.
  //audio.first.url; // This is the audio stream url.

  // Make sure to handle the file extension properly. Especially m3u8 streams might require further processing.

  // Close the YoutubeExplode's http client.
  yt.close();
}
