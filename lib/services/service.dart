import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_project/services/model.dart';

const String countryCollectionName = "countries";
const String stateCollectionName = "state";
const String cityCollectionName = "city";

class FireStoreDataViewService {
  final _firebaseInstance = FirebaseFirestore.instance;

  getTypeFunction(DataType type) {
    switch (type) {
      case DataType.country:
       return FireStoreDataViewService().getCountries();
      case DataType.state:
        return FireStoreDataViewService().getStates();
      case DataType.city:
        return FireStoreDataViewService().getCity();
    }
  }

  Stream<QuerySnapshot> getCountries() {
    final CollectionReference collection = _firebaseInstance
        .collection(countryCollectionName)
        .withConverter<FireStoreDataModel>(
          fromFirestore: (snapshot, _) =>
              FireStoreDataModel.fromJson(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );
    return collection.snapshots();
  }

  Stream<QuerySnapshot> getStates() {
    final CollectionReference collection = _firebaseInstance
        .collection(stateCollectionName)
        .withConverter<FireStoreDataModel>(
          fromFirestore: (snapshot, _) =>
              FireStoreDataModel.fromJson(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );
    return collection.snapshots();
  }

  Stream<QuerySnapshot> getCity() {
    final CollectionReference collection = _firebaseInstance
        .collection(cityCollectionName)
        .withConverter<FireStoreDataModel>(
          fromFirestore: (snapshot, _) =>
              FireStoreDataModel.fromJson(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );
    return collection.snapshots();
  }
}
