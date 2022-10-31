import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/user_model.dart';

import '../model/order_model.dart';

class FireStoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> createUser(UserModel user) {
    return _usersCollectionReference.doc(user.uid).set({
      'email': user.email,
      'uid': user.uid,
      'name': user.name,
      'photoUrl': user.photoUrl,
      'phoneNumber': user.phoneNumber,
      'address': user.address,
      'userType': user.userType,
      'orderHistory': []
    });
  }

  Future<void> addOrder(OrderModel order) async {
    if (FirebaseAuth.instance.currentUser != null) {
      return await _usersCollectionReference
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'orderHistory':
            FieldValue.arrayUnion([order.toMap()])
      });
    } else {
      throw Exception('User not found');
    }
  }

  //get order history
  Future<List<OrderModel>> getOrderHistory() async {
    if (FirebaseAuth.instance.currentUser != null) {
      final DocumentSnapshot documentSnapshot =
          await _usersCollectionReference
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get();
      if (documentSnapshot.exists) {
        final List<dynamic> orderHistory =
            documentSnapshot.get('orderHistory');
        return orderHistory
            .map((e) => OrderModel.fromMap(e))
            .toList();
      } else {
        throw Exception('User not found');
      }
    } else {
      throw Exception('User not found');
    }
  }

  //get user details
  Future<UserModel> getUserDetails() async {
    if (FirebaseAuth.instance.currentUser != null) {
      final DocumentSnapshot documentSnapshot =
          await _usersCollectionReference
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get();
      if (documentSnapshot.exists) {
        return UserModel.fromMap(documentSnapshot.data()!
            as Map<String, dynamic>);
      } else {
        throw Exception('User not found');
      }
    } else {
      throw Exception('User not found');
    }
  }
}
