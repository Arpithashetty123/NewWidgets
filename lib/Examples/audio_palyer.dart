import 'package:flutter/material.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  late AudioPlayer _audioPlayer;

  //final _playList = ConcatenatingAudioSource(children: []);
  Stream<PostionData> get _postionDataStrem =>
      Rx.combineLatest3<Duration, Duration, Duration?, PostionData>(
          _audioPlayer.positionStream,
          _audioPlayer.bufferedPositionStream,
          _audioPlayer.durationStream,
          (postion, bufferedPosition, duration) => PostionData(
              postion, bufferedPosition, duration ?? Duration.zero));

  @override
  void initState() {
    _audioPlayer = AudioPlayer()
      ..setAsset("assets/audio/inspirational-background-112290.mp3");
    super.initState();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.keyboard_arrow_left_outlined)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.black45, Colors.blue.shade900])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/ella-jardim-M0zs81FNm6s-unsplash.jpg",
              height: 250,
              width: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 45,),
            StreamBuilder<PostionData>(
              stream: _postionDataStrem,
              builder: (context, snapshot) {
                final postionData = snapshot.data;
                return SizedBox(
                  width: 400,
                  child: ProgressBar(
                    progress: postionData?.postion ?? Duration.zero,
                    buffered: postionData?.bufferedPosition ?? Duration.zero,
                    total: postionData?.duration ?? Duration.zero,
                    onSeek: _audioPlayer.seek,
                    thumbColor: Colors.red,
                    progressBarColor: Colors.red,
                    bufferedBarColor: Colors.grey.shade500,
                    baseBarColor: Colors.grey.shade400,
                    barHeight: 10,
                    timeLabelTextStyle: const TextStyle(color: Colors.white),
                    timeLabelPadding: 10,
                  ),
                );
              },
            ),
            Controls(audioPlayer: _audioPlayer)
          ],
        ),
      ),
    );
  }
}

class Controls extends StatelessWidget {
  const Controls({super.key, required this.audioPlayer});
  final AudioPlayer audioPlayer;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: audioPlayer.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if (!(playing ?? false)) {
          return IconButton(
            onPressed: audioPlayer.play,
            icon: Icon(Icons.play_arrow_rounded),
            iconSize: 50,
            color: Colors.white,
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            onPressed: audioPlayer.pause,
            icon: Icon(Icons.pause_rounded),
            iconSize: 50,
            color: Colors.white,
          );
        }
        return const Icon(
          Icons.play_arrow_rounded,
          size: 80,
          color: Colors.white,
        );
      },
    );
  }
}

class PostionData {
  final Duration postion;
  final Duration bufferedPosition;
  final Duration duration;

  PostionData(this.postion, this.bufferedPosition, this.duration);
}
