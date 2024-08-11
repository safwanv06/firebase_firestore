import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../services/model.dart';
import '../../../services/service.dart';

class AdminService {
  final _firebaseInstance = FirebaseFirestore.instance;

  addCountry(FireStoreDataModel data) {
    final CollectionReference collection = _firebaseInstance
        .collection(countryCollectionName)
        .withConverter<FireStoreDataModel>(
          fromFirestore: (snapshot, _) =>
              FireStoreDataModel.fromJson(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );
    collection.add(data);
  }

  addState(FireStoreDataModel data) {
    final CollectionReference collection = _firebaseInstance
        .collection(stateCollectionName)
        .withConverter<FireStoreDataModel>(
          fromFirestore: (snapshot, _) =>
              FireStoreDataModel.fromJson(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );
    collection.add(data);
  }

  addCity(FireStoreDataModel data) {
    final CollectionReference collection = _firebaseInstance
        .collection(cityCollectionName)
        .withConverter<FireStoreDataModel>(
      fromFirestore: (snapshot, _) =>
          FireStoreDataModel.fromJson(snapshot.data()!),
      toFirestore: (value, _) => value.toJson(),
    );
    collection.add(data);
  }
}
