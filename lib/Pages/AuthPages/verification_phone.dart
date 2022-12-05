// import 'package:dwa2y/Constants/constants.dart';
// import 'package:dwa2y/Controllers/AuthRepositories/auth_services.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../Widgets/custom_elevated_button.dart';

// class VerificationPhone extends GetView<AuthServices> {
//   String otpCode = "";

//   VerificationPhone({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       appBar: AppBar(
//         title: Text("Enter Verification Code  ",
//             style: GoogleFonts.ubuntu(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white)),
//         leading: const BackButton(color: Colors.white),
//         backgroundColor: Constants().primaryColor.withOpacity(0.6),
//         elevation: 0,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Constants().primaryColor.withOpacity(0.6),
//                 Constants().primaryColor.withOpacity(0.3),
//               ]),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("We Have Sent You OTP please check and write it down   ",
//                   style: GoogleFonts.ubuntu(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white)),
           
//               OtpTextField(
//                 numberOfFields: 6,
//                 showFieldAsBox: true,
//                 textStyle: GoogleFonts.roboto(color: Colors.white),
//                 enabledBorderColor: Colors.blueGrey,
//                 disabledBorderColor: Colors.blueGrey,
//                 focusedBorderColor: Colors.blueGrey,
//                 onSubmit: (value) {
//                  // controller.verifyOTP(value);
//                   otpCode=value;
//                 },
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
            
                
                 
//                         CustomElevatedButton(
//                                          width: width,
//                                          height: height * 0.4,
//                                          onPressed: () {
                                          
//                                           controller.verifyOTP(otpCode);
                                          
//                                          },
//                                          text: "Continue"
                                     
                                    
//                                    ),
                    
                     
                
//             ],
//           ),
//         ),
//       ),
//     );
//   }


// }


