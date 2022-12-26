import 'package:dwa2y/Controllers/MyAccountServices/myaccount_controller.dart';
import 'package:dwa2y/Pages/GoogleMapPages/googlemap_page.dart';
import 'package:dwa2y/Widgets/custom_elevated_button.dart';
import 'package:dwa2y/Widgets/custom_text_field.dart';
import 'package:dwa2y/Widgets/custome_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/constants.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          "Personal Information",
          style: GoogleFonts.roboto(color: Colors.white, fontSize: 16),
        ),
        backgroundColor: Constants().primaryColor.withOpacity(0.3),
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Constants().primaryColor.withOpacity(0.6),
                Constants().primaryColor.withOpacity(0.3),
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Constants().primaryColor.withOpacity(0.6),
                        Constants().primaryColor.withOpacity(0.3),
                      ]),
                ),
                child: GetX<MyAccountController>(
                  builder: (controller) {
                    return Column(
                      children: [
                        CustomListTile(
                          title: "Name",
                          onTap: () {
                            
                            Get.defaultDialog(
                              confirm:CustomElevatedButton(width: 120, height: 60, onPressed: ()async{

                                await controller.updateUserName(controller.usernameController.value.text.trim());
                              }, text: "Confirm"),
                              cancel: CustomElevatedButton(width: 120, height: 60, onPressed: (){
                                Get.back();
                              }, text: "Cancel"),
                              
                              content: CustomTextField(hintText: "username", validator: (p0){}, controller: controller.usernameController.value),
                            );
                              },
                    
                        
                          subtitile: controller.currentUserData.value.username!,
                        ),
                        CustomListTile(
                          title: "Email",
                          subtitile:
                              controller.currentUserData.value.email != null &&
                                      controller.currentUserData.value.email!
                                          .isNotEmpty
                                  ? controller.currentUserData.value.email!
                                  : "Tap to Set",
                          onTap: () {
                            Get.to(() => const GoogleMapPage());
                          },
                        ),
                        CustomListTile(
                          title: "Gender",
                          onTap: () {},
                          subtitile: controller.currentUserData.value.username!,
                        ),
                        CustomListTile(
                          title: "Birthday",
                          onTap: () {
                            DatePicker.showDatePicker(context,
                                onConfirm: (time) async {
                              await controller.updateBirthDay(time.toString());
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en);
                          },
                          subtitile:
                              controller.currentUserData.value.birthday !=
                                          null &&
                                      controller.currentUserData.value.birthday!
                                          .isNotEmpty
                                  ? controller.currentUserData.value.birthday!
                                      .substring(0, 10)
                                  : "Tap to set",
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
