import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:quickserve/controllers/user_controller.dart";

class FavoritesPage extends StatelessWidget {
  FavoritesPage({super.key});
  final UserController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorites",
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Obx(() {
        return controller.favouriteList.isEmpty
            ? Center(
              child: Text(
                "No favorites yet!",
                style: TextStyle(
                  color: Colors.deepPurple.shade300,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
            : ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      controller.favouriteList[index].image,
                    ),
                  ),
                  title: Text(
                    "${controller.favouriteList[index].firstName} ${controller.favouriteList[index].lastName}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    controller.favouriteList[index].address.city,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      controller.addToFavourite(
                        controller.favouriteList[index],
                      );
                    },
                  ),
                );
              },
              itemCount: controller.favouriteList.length,
            );
      }),
    );
  }
}
