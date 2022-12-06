import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SoundPlate extends StatelessWidget {

  SoundPlate({required this.noteindex,required this.color });

  final int noteindex;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(

        onPanStart:(dra) {
          final player = AudioCache();
          player.play('music/note$noteindex.mp3');
         },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              color: color.withOpacity(0.95),
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.circle_outlined, size: 30,),
              Icon(Icons.circle_outlined, size: 30,),
            ],
          ),
        ),
      ),
    );
  }
}