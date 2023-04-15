class GalleryModel {
  int id;
  String url;

  GalleryModel({this.id, this.url});

  //membuat contruc pada model berben json
  GalleryModel.formJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }
  //mambuat function menguabh menjadi Json
  Map<String, dynamic> toJson() {
    return {'id': id, 'url': url};
  }
}
