import 'package:flutter/material.dart';
import 'AnimalClasses.dart';
import 'AnimalPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal Group',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  List<AnimalGroup> groupAnimal =
  [
    AnimalGroup( groupID: 1,groupImage: 'mamel2.jpg',groupName: 'Mammal Family'),
    AnimalGroup(groupID: 2, groupImage: 'bird2.jpg', groupName: 'Bird Family')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 12 / 8,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0,
        children: [
          for(AnimalGroup group in groupAnimal)
            Expanded(
              child: IconButton(iconSize: 400,tooltip: group.groupName,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AnimalPage(groupID: group.groupID))),
                  icon: CircleAvatar(child: Text(group.groupName!,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
                    backgroundImage:AssetImage('assets/images/${group.groupImage!}'),radius: 150.0,)),
            ),

        ])
    );
  }
}
