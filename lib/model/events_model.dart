class event {
  String? confirm;
  String? name;
  String? managerName;
  String? phone;
  String? typeCode;
  String? date;
  String? id;
  String? managerCode;
  String? typeName;
  String? time;

  event(
      {this.confirm,
      this.name,
      this.managerName,
      this.phone,
      this.typeCode,
      this.date,
      this.id,
      this.managerCode,
      this.typeName,
      this.time});

  event.fromJson(Map<String, dynamic> json) {
    confirm = json['confirm'];
    name = json['name'];
    managerName = json['managerName'];
    phone = json['phone'];
    typeCode = json['typeCode'];
    date = json['date'];
    id = json['id'];
    managerCode = json['managerCode'];
    typeName = json['typeName'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confirm'] = this.confirm;
    data['name'] = this.name;
    data['managerName'] = this.managerName;
    data['phone'] = this.phone;
    data['typeCode'] = this.typeCode;
    data['date'] = this.date;
    data['id'] = this.id;
    data['managerCode'] = this.managerCode;
    data['typeName'] = this.typeName;
    data['time'] = this.time;
    return data;
  }
}
