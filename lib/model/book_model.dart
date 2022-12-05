class book {
  int? seq;
  String? confirm;
  String? managerCode;
  String? typeName;
  String? time;
  String? managerName;
  String? id;
  String? name;
  String? phone;
  String? typeCode;
  String? date;

  book(
      {this.seq,
      this.confirm,
      this.managerCode,
      this.typeName,
      this.time,
      this.managerName,
      this.id,
      this.name,
      this.phone,
      this.typeCode,
      this.date});

  book.fromJson(Map<String, dynamic> json) {
    seq = json['seq'];
    confirm = json['confirm'];
    managerCode = json['managerCode'];
    typeName = json['typeName'];
    time = json['time'];
    managerName = json['managerName'];
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    typeCode = json['typeCode'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seq'] = this.seq;
    data['confirm'] = this.confirm;
    data['managerCode'] = this.managerCode;
    data['typeName'] = this.typeName;
    data['time'] = this.time;
    data['managerName'] = this.managerName;
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['typeCode'] = this.typeCode;
    data['date'] = this.date;
    return data;
  }
}
