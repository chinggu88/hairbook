class register {
  String? _date;
  List<Event>? _event;

  register({String? date, List<Event>? event}) {
    if (date != null) {
      this._date = date;
    }
    if (event != null) {
      this._event = event;
    }
  }

  String? get date => _date;
  set date(String? date) => _date = date;
  List<Event>? get event => _event;
  set event(List<Event>? event) => _event = event;

  register.fromJson(Map<String, dynamic> json) {
    _date = json['date'];
    if (json['event'] != null) {
      _event = <Event>[];
      json['event'].forEach((v) {
        _event!.add(new Event.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this._date;
    if (this._event != null) {
      data['event'] = this._event!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Event {
  String? _time;
  String? _typeName;
  String? _typeCode;
  String? _phone;
  String? _managerName;
  String? _managerCode;
  String? _confirm;

  Event(
      {String? time,
      String? typeName,
      String? typeCode,
      String? phone,
      String? managerName,
      String? managerCode,
      String? confirm}) {
    if (time != null) {
      this._time = time;
    }
    if (typeName != null) {
      this._typeName = typeName;
    }
    if (typeCode != null) {
      this._typeCode = typeCode;
    }
    if (phone != null) {
      this._phone = phone;
    }
    if (managerName != null) {
      this._managerName = managerName;
    }
    if (managerCode != null) {
      this._managerCode = managerCode;
    }
    if (confirm != null) {
      this._confirm = confirm;
    }
  }

  String? get time => _time;
  set time(String? time) => _time = time;
  String? get typeName => _typeName;
  set typeName(String? typeName) => _typeName = typeName;
  String? get typeCode => _typeCode;
  set typeCode(String? typeCode) => _typeCode = typeCode;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  String? get managerName => _managerName;
  set managerName(String? managerName) => _managerName = managerName;
  String? get managerCode => _managerCode;
  set managerCode(String? managerCode) => _managerCode = managerCode;
  String? get confirm => _confirm;
  set confirm(String? confirm) => _confirm = confirm;

  Event.fromJson(Map<String, dynamic> json) {
    _time = json['time'];
    _typeName = json['type_name'];
    _typeCode = json['type_code'];
    _phone = json['phone'];
    _managerName = json['manager_name'];
    _managerCode = json['manager_code'];
    _confirm = json['confirm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this._time;
    data['type_name'] = this._typeName;
    data['type_code'] = this._typeCode;
    data['phone'] = this._phone;
    data['manager_name'] = this._managerName;
    data['manager_code'] = this._managerCode;
    data['confirm'] = this._confirm;
    return data;
  }
}
