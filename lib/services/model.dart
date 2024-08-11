class FireStoreDataModel {
  FireStoreDataModel({required this.name});

  String name;

  FireStoreDataModel.fromJson(Map<String, Object?> json)
      : this(name: json["country"]! as String);

  Map<String, Object?> toJson() {
    return {"country": name};
  }
}

enum DataType{
  country,
  state,
  city
}
