class AnimalGroup {
  int? groupID;
  String? groupName;
  String? groupImage;

  AnimalGroup(
      {required this.groupID,
        required this.groupImage,
        required this.groupName});
}

class Animal {
  int? groupID;
  int? animalID;
  String? animalName;
  String? animalImage;
  String? animalAudio;
  String? animalVideo;

  Animal(
      {required this.groupID,
        required this.animalID,
        required this.animalName,
        required this.animalImage,
        this.animalAudio,
        this.animalVideo});

}
