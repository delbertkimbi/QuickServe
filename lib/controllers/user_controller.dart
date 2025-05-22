import 'package:get/get.dart';
import 'package:quickserve/models/user_model.dart';
import 'package:quickserve/services/remote_services.dart';

class UserController extends GetxController {
  var userList = <User>[].obs;
  @override
  onInit(){
    fetchUsers();
    super.onInit();
  }
  fetchUsers() async {
    var users = await RemoteServices.fetchUsers();
    if (users != null) {
      userList.assignAll(users);
    }
  }
}
