import 'package:stablemanager/models/user.dart';

abstract class BaseAuth {
  Future<String> getAccessToken(String audience);

  User getUser();

  Future<Map> getUserDetails();

  Future<bool> loginAction();

  Future<void> logoutAction();

  Future<bool> initAction();

  Future<User> updateUserDetails(User user);

  Future<String> updateUserPassword(String password);

  Future<bool> deleteUser(User user);
}

class Auth implements BaseAuth {
  @override
  Future<bool> deleteUser(User user) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<String> getAccessToken(String audience) {
    // TODO: implement getAccessToken
    throw UnimplementedError();
  }

  @override
  User getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<Map> getUserDetails() {
    // TODO: implement getUserDetails
    throw UnimplementedError();
  }

  @override
  Future<bool> initAction() {
    // TODO: implement initAction
    throw UnimplementedError();
  }

  @override
  Future<bool> loginAction() {
    // TODO: implement loginAction
    throw UnimplementedError();
  }

  @override
  Future<void> logoutAction() {
    // TODO: implement logoutAction
    throw UnimplementedError();
  }

  @override
  Future<User> updateUserDetails(User user) {
    // TODO: implement updateUserDetails
    throw UnimplementedError();
  }

  @override
  Future<String> updateUserPassword(String password) {
    // TODO: implement updateUserPassword
    throw UnimplementedError();
  }
}
