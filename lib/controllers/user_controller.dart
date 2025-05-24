import 'package:get/get.dart';
import 'package:quickserve/models/user_model.dart';
import 'package:quickserve/services/remote_services.dart';

class UserController extends GetxController {
  var userList = <User>[].obs;
  var favouriteList = <User>[].obs;
  RxBool isLoading = true.obs;
  @override
  onInit() {
    fetchUsers();
    super.onInit();
  }

  fetchUsers() async {
    try {
      isLoading(true);
      var users = await RemoteServices.fetchUsers();
      isLoading.value = false;
      userList.assignAll(users);
    } finally {
      isLoading(false);
    }
  }
  addToFavourite(User user) {
    if (!favouriteList.contains(user)) {
      favouriteList.add(user);
    } else {
      favouriteList.remove(user);
    }
  }
}
