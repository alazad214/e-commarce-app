import 'package:ecommece2/controllers/auth_controllers.dart';
import 'package:ecommece2/pages/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../const/appcolors.dart';
import '../widgets/appbarC.dart';
import '../widgets/buttonC.dart';
import '../widgets/textfieldC.dart';
import '../widgets/title_subtitleC.dart';
import 'login.dart';

class Profile_SetUp extends StatelessWidget {
  Profile_SetUp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Auth_Controller());

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.navy_,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Title_SubtitleC(
                        title: "Profile Setup",
                        subtitle: "Complete your profile & enjoy this app!"),
                    const SizedBox(height: 30),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                            clipBehavior: Clip.antiAlias,
                            height: 130,
                            width: 130,
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Image.network(
                              "https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-image-182145777.jpg",
                              fit: BoxFit.cover,
                            )),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(width: 2)),
                          child: Icon(Icons.camera_enhance),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        TextFieldC(
                          hinttext: "Name",
                          isrequired: true,
                          icon: Icons.drive_file_rename_outline,
                          onchanged: (name) => controller.fullName.value = name,
                        ),
                        const SizedBox(height: 20),
                        TextFieldC(
                          hinttext: "Phone ",
                          isrequired: true,
                          icon: Icons.call,
                          onchanged: (phone) =>
                              controller.phoneNumber.value = phone,
                        ),
                        const SizedBox(height: 20),
                        TextFieldC(
                          hinttext: "Address",
                          isrequired: true,
                          icon: Icons.location_on,
                          onchanged: (address) =>
                              controller.address.value = address,
                        ),
                        const SizedBox(height: 20),
                        ButtonC(
                          text: "Complete profile",
                          backgroundColor: Colors.grey,
                          ontap: () {
                            controller.profileSetUp();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
