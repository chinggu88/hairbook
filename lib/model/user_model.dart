class User {
  String? name;
  String? fcmkey;
  String? type;
  String? updatedate;
  String? id;
  String? phone;
  String? insertdate;

  User(
      {this.name,
      this.fcmkey,
      this.type,
      this.updatedate,
      this.id,
      this.phone,
      this.insertdate});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fcmkey = json['fcmkey'];
    type = json['type'];
    updatedate = json['updatedate'];
    id = json['id'];
    phone = json['phone'];
    insertdate = json['insertdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['fcmkey'] = this.fcmkey;
    data['type'] = this.type;
    data['updatedate'] = this.updatedate;
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['insertdate'] = this.insertdate;
    return data;
  }
}
