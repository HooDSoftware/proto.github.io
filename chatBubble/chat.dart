// ignore_for_file: library_private_types_in_public_api, avoid_print, unused_local_variable, prefer_const_declarations

import 'package:flutter/material.dart';

import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:audioplayers/audioplayers.dart';

class ChatBubble extends StatefulWidget {
  final String title;
  const ChatBubble({Key? key, required this.title}) : super(key: key);

  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  AudioPlayer audioPlayer =  AudioPlayer();
  Duration duration =  const Duration();
  Duration position =  const Duration();
  bool isPlaying = false;
  bool isLoading = false;
  bool isPause = false;

  @override
  Widget build(BuildContext context) {
    final now =  DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                BubbleNormalAudio(
                  color: const Color(0xFFE8E8EE),
                  duration: duration.inSeconds.toDouble(),
                  position: position.inSeconds.toDouble(),
                  isPlaying: isPlaying,
                  isLoading: isLoading,
                  isPause: isPause,
                  onSeekChanged: _changeSeek,
                  onPlayPauseButtonClick: _playAudio,
                  sent: true,
                ),
                BubbleNormal(
                  text: 'hello',
                  isSender: false,
                  color: const Color(0xFF1B97F3),
                  tail: true,
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                BubbleNormal(
                  text: 'hi',
                  isSender: true,
                  color: const Color(0xFFE8E8EE),
                  tail: true,
                  sent: true,
                ),
                DateChip(
                  date: DateTime(now.year, now.month, now.day - 2),
                ),
                BubbleNormal(
                  text: 'nice car you have there....',
                  isSender: false,
                  color: const Color(0xFF1B97F3),
                  tail: false,
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                BubbleNormal(
                  text: 'thanks bro',
                  color: const Color(0xFFE8E8EE),
                  tail: false,
                  sent: true,
                  seen: true,
                  delivered: true,
                ),
                const BubbleSpecialOne(
                  text: 'do you deliver to specified locations?',
                  isSender: false,
                  color: Color(0xFF1B97F3),
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                DateChip(
                  date: DateTime(now.year, now.month, now.day - 1),
                ),
                const BubbleSpecialOne(
                  text: 'Yeah...where do you want it at?',
                  color: Color(0xFFE8E8EE),
                  seen: true,
                ),
                const BubbleSpecialOne(
                  text: 'protonrive Airport',
                  isSender: false,
                  tail: false,
                  color: Color(0xFF1B97F3),
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const BubbleSpecialOne(
                  text: 'sure bro,,what time',
                  tail: false,
                  color: Color(0xFFE8E8EE),
                  sent: true,
                ),
                const BubbleSpecialTwo(
                  text: 'aroun noon',
                  isSender: false,
                  color: Color(0xFF1B97F3),
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                DateChip(
                  date: now,
                ),
                const BubbleSpecialTwo(
                  text:
                      'okay then....just finish up the reservation on the app first then',
                  isSender: true,
                  color: Color(0xFFE8E8EE),
                  sent: true,
                ),
                const BubbleSpecialTwo(
                  text: 'okay....sure',
                  isSender: false,
                  tail: false,
                  color: Color(0xFF1B97F3),
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const BubbleSpecialTwo(
                  text: 'for how long can I stay with it on the maximum',
                  tail: false,
                  color: Color(0xFFE8E8EE),
                  delivered: true,
                ),
                const BubbleSpecialThree(
                  text: 'a week,a month...choice is yours bro',
                  color: Color(0xFF1B97F3),
                  tail: false,
                  textStyle: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const BubbleSpecialThree(
                  text: 'oh...really,ok then',
                  color: Color(0xFF1B97F3),
                  tail: true,
                  textStyle: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const BubbleSpecialThree(
                  text: "so for how long will you have it",
                  color: Color(0xFFE8E8EE),
                  tail: false,
                  isSender: false,
                ),
                const BubbleSpecialThree(
                  text: "just finish up on the app first bro",
                  color: Color(0xFFE8E8EE),
                  tail: true,
                  isSender: false,
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
          MessageBar(
            onSend: (_) => print(_),
            actions: [
              InkWell(
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 24,
                ),
                onTap: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: InkWell(
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.green,
                    size: 24,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _changeSeek(double value) {
    setState(() {
      audioPlayer.seek(Duration(seconds: value.toInt()));
    });
  }

  void _playAudio() async {
    final url =
        'https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3';
    if (isPause) {
      await audioPlayer.resume();
      setState(() {
        isPlaying = true;
        isPause = false;
      });
    } else if (isPlaying) {
      await audioPlayer.pause();
      setState(() {
        isPlaying = false;
        isPause = true;
      });
    } else {
      setState(() {
        isLoading = true;
      });
      //   await audioPlayer.play(url);
      //   setState(() {
      //     isPlaying = true;
      //   });
      // }

      audioPlayer.onDurationChanged.listen((Duration d) {
        setState(() {
          duration = d;
          isLoading = false;
        });
      });

      // audioPlayer.onAudioPositionChanged.listen((Duration p) {
      //   setState(() {
      //     position = p;
      //   });
      // });
//     audioPlayer.onPlayerCompletion.listen((event) {
//       setState(() {
//         isPlaying = false;
//         duration = new Duration();
//         position = new Duration();
//       });
//     });
    }
  }
}
