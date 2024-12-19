class OnBoardDataModel {
  late List<OnBoardDataList> data;

  OnBoardDataModel({required this.data});

  OnBoardDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OnBoardDataList>[];
      json['data'].forEach((v) {
        data.add(OnBoardDataList.fromJson(v));
      });
    }
  }
}

class OnBoardDataList {
  late String title;
  late String image;
  late String description;

  OnBoardDataList({
    required this.title,
    required this.image,
    required this.description,
  });

  OnBoardDataList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    description = json['description'];
  }
}
