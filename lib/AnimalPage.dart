import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'AnimalClasses.dart';
import 'package:audioplayers/audioplayers.dart';
import 'Play.dart';


class AnimalPage extends StatelessWidget {

  final int? groupID;
  AnimalPage({this.groupID});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal Group',
      debugShowCheckedModeBanner: false,
      home: AnimalPageView(groupID:this.groupID),
    );
  }
}

class AnimalPageView extends StatefulWidget {

  final int? groupID;
  AnimalPageView({this.groupID});

  @override
  _AnimalPageViewState createState() => _AnimalPageViewState();
}

class _AnimalPageViewState extends State<AnimalPageView> {

  AudioPlayer audioPlayer = AudioPlayer();

  List<Animal> animalList=[
    Animal(groupID: 1, animalID: 1, animalName: 'Cat', animalImage: 'cat.jpg',animalAudio: '1.mp3',animalVideo: ''),
    Animal(groupID: 1, animalID: 2, animalName: 'Cow', animalImage: 'cow.jpg',animalAudio: '2.mp3',animalVideo: ''),
    Animal(groupID: 1, animalID: 3, animalName: 'Elephant', animalImage: 'elephant.jpg',animalAudio: '3.mp3',animalVideo: ''),
    Animal(groupID: 1, animalID: 4, animalName: 'Goat', animalImage: 'goat.jpg',animalAudio: '4.mp3',animalVideo: ''),
    Animal(groupID: 1, animalID: 5, animalName: 'Horse', animalImage: 'horses.webp',animalAudio: '5.mp3',animalVideo: ''),
    Animal(groupID: 2, animalID: 6, animalName: 'Chicken', animalImage: 'chicken.jpg',animalAudio: '6.mp3',animalVideo: ''),
  ];

  void playAnimalSound(String audioFile) async
  {

    int result = await audioPlayer.play('assets/audio/$audioFile', isLocal: true);


  }

  void PlayAnimalVideo(String videoFile)
  {
    // VideoPlayer videoPlayer=VideoPlayer(VideoPlayerController _controller);

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(body:GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 12 / 8,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0,
        children: [
          for(Animal animal in animalList)
            if(animal.groupID==widget.groupID)
              InkWell(onTap: ()=>playAnimalSound(animal.animalAudio!),
                onDoubleTap: ()=>PlayAnimalVideo(animal.animalVideo!),
                child: CircleAvatar(child: Text(animal.animalName!,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.pinkAccent),),
                  backgroundImage:AssetImage('assets/images/${animal.animalImage!}'),radius: 150.0,), ),
        ])
    );
  }
}