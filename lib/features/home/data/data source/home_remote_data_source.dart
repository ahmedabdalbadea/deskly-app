import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deskly_app/constants.dart';
import 'package:deskly_app/features/home/data/model/category_model/category_model.dart';
import 'package:deskly_app/features/home/data/model/user_model/user_model.dart';
import 'package:deskly_app/features/home/data/model/workspace_model/workspace_model.dart';
import 'package:deskly_app/features/home/data/model/workspace_model/workspaces_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeRemoteDataSource {
  const HomeRemoteDataSource({required this._auth, required this._firestore});

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  String? getUserId() => _auth.currentUser?.uid;

  Future<UserModel> fetchUserData({required String uId}) async {
    final response = await _firestore
        .collection(kUsersCollection)
        .doc(uId)
        .get();
    return UserModel.fromJson(response.data()!);
  }

  Future<String?> fetchUserUId() async {
    return _auth.currentUser?.uid;
  }

  Future<List<CategoryModel>> fetchCategories() async {
    final response = await _firestore.collection(kCategoriesCollection).get();
    return response.docs
        .map((doc) => CategoryModel.fromJson(doc.data()))
        .toList();
  }

  Future<List<WorkspaceModel>> fetchWorkspacesByCategory({
    required String categoryId,
    required double latitude,
    required double longitude,
  }) async {
    final response = await _firestore
        .collection(kWorkspacesCollection)
        .where(kWorspacesCategoryIdField, isEqualTo: categoryId)
        .get();
    return response.docs
        .map((doc) => WorkspaceModel.fromJson(doc.data()))
        .toList();
  }

  Future<List<WorkspaceModel>> fetchAllWorkSpaces() async {
    final response = await _firestore.collection(kWorkspacesCollection).get();
    return response.docs
        .map((doc) => WorkspaceModel.fromJson(doc.data()))
        .toList();
  }

  Future<WorkspacesPage> fetchPopularWorkspaces({
    DocumentSnapshot? startAfter,
    int pageSize = 10,
  }) async {
    var query = _firestore
        .collection(kWorkspacesCollection)
        .orderBy(kWorkspacesRatingField)
        .limit(pageSize);

    if (startAfter != null) {
      query = query.startAfterDocument(startAfter);
    }
    final response = await query.get();
    return WorkspacesPage(
      workspaces: response.docs
          .map((doc) => WorkspaceModel.fromJson(doc.data()))
          .toList(),
      lastDocument: response.docs.isNotEmpty ? response.docs.last : null,
    );
  }
}
