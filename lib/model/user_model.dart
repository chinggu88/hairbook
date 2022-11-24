class User {
  ///이름
  String? name;

  ///푸쉬메세지 키
  String? fcmkey;

  ///회원 등급
  String? type;

  ///업데이트 날짜
  String? updatedate;

  ///아이디(이메일)
  String? id;

  ///로그인 인증키
  String? uid;

  ///연락처
  String? phone;

  ///최초 로그인 날짜
  String? insertdate;

  User(
      {this.name,
      this.fcmkey,
      this.type,
      this.updatedate,
      this.id,
      this.uid,
      this.phone,
      this.insertdate});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fcmkey = json['fcmkey'];
    type = json['type'];
    updatedate = json['updatedate'];
    id = json['id'];
    uid = json['uid'];
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
    data['uid'] = this.uid;
    data['phone'] = this.phone;
    data['insertdate'] = this.insertdate;
    return data;
  }
}
