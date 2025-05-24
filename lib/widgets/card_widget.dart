import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickserve/controllers/user_controller.dart';
import 'package:quickserve/models/user_model.dart';
import 'package:redacted/redacted.dart';

class CardWidget extends StatelessWidget {
  CardWidget({super.key, required this.user});
  final User user;
  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          Card(
            color: Colors.white,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    user.image,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    '${user.firstName} ${user.lastName}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    user.company.department,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    user.address.city,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 2,
                          ),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.deepPurple,
                          ),
                          child: Row(
                            children: [
                              Text(
                                user.height.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Icon(Icons.star_outlined, color: Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ).redacted(
                context: context,
                redact: userController.isLoading.value,
                configuration: RedactedConfiguration(
                  redactedColor: Colors.grey.shade200,
                  animationDuration: const Duration(
                    milliseconds: 800,
                  ), //default
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              icon: Icon(
                userController.favouriteList.contains(user)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color:
                    userController.favouriteList.contains(user)
                        ? Colors.red
                        : Colors.grey,
              ),
              onPressed: () {
                userController.addToFavourite(user);
              },
            ),
          ),
        ],
      );
    });
  }
}
