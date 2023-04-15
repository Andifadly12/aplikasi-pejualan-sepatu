class UserMadel {
  int id;
  String name;
  String email;
  String username;
  String profilePhotoUrl;
  String token;

  UserMadel(
      {this.id,
      this.name,
      this.email,
      this.username,
      this.profilePhotoUrl,
      this.token});

  // contruc apa bila dia dari json

  UserMadel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    profilePhotoUrl = json['profile_photo_url'];
    token = json['token'];
  }
  //membuat fuction untuk mengubah user model menjadi json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'profile_photo_url': profilePhotoUrl,
      'token': token
    };
  }
}
