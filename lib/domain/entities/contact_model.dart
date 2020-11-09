class ContactModel {
  String name;
  String role;

  ContactModel({this.name, this.role});

  ContactModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['role'] = this.role;
    return data;
  }
}
