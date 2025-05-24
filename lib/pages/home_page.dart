import 'package:flutter/material.dart';
import 'package:quickserve/pages/favorites_page.dart';
import 'package:quickserve/widgets/card_widget.dart';
import 'package:quickserve/widgets/category_widget.dart';
import 'package:get/get.dart';
import 'package:quickserve/controllers/user_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          SizedBox(width: 10),

          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.white),
            onPressed: () {
              Get.to(FavoritesPage());
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'QuickServe',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 23,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 140,
            child: Obx(() {
              return userController.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CategoryWidget(
                        text: userController.userList[index].company.name[0],
                        image: userController.userList[index].image,
                      );
                    },
                    itemCount:
                        userController.userList.length < 9
                            ? userController.userList.length
                            : 9,
                    padding: const EdgeInsets.only(top: 10),
                  );
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Service Providers',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  spacing: 10,
                  children: [
                    Icon(Icons.grid_view, size: 30, color: Colors.deepPurple),
                    Icon(Icons.table_rows, size: 30, color: Colors.deepPurple),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Obx(() {
              return GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.87,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  return CardWidget(user: userController.userList[index]);
                },
                itemCount: userController.userList.length,
              );
            }),
          ),
        ],
      ),
    );
  }
}
