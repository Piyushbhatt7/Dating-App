import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/homeScreen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dating_app/models/person.dart' as personModel;

class AuthenticationController extends GetxController{

  static AuthenticationController  authController = Get.find();
 
 late Rx<File?> pickedFile;
 File? get profileImage => pickedFile.value;
 XFile? imageFile;


// using gallery
 pickImageFileFromGallery() async
 {
    imageFile =   await ImagePicker().pickImage(source: ImageSource.gallery);

   if(imageFile != null){
    Get.snackbar("Profile Image", "you have successfully picked your profile image using Gallery. ");
   }

   pickedFile = Rx<File?> (File(imageFile!.path));
 }

// using camera

 captureImageFromPhoneCamera() async
 {
    imageFile =   await ImagePicker().pickImage(source: ImageSource.camera);

   if(imageFile != null){
    Get.snackbar("Profile Image", "you have successfully picked your profile image using camera. ");
   }

   pickedFile = Rx<File?> (File(imageFile!.path));
 }

 Future<String> uploadImageToStorage(File imageFile) async{

     Reference referenceStorage = FirebaseStorage.instance.ref()
     .child("Profile Images")
     .child(FirebaseAuth.instance.currentUser!.uid);

     UploadTask task = referenceStorage.putFile(imageFile);
     TaskSnapshot snapshot = await task;

    String downloadUrlOfImage =  await snapshot.ref.getDownloadURL();

    return downloadUrlOfImage;
  }

   createNewUserAccount(
  
  // personal info
  File imageProfile,
  String email,
  String password,
  String name,
  String age,
  String phoneNo,
  String city,
  String country,
  String profileHeading,
  String lookingForInaPartner,
  String publishedDateTime,

  // appereance
  String height,
  String weight,
  String bodyType,

  
  // life style
  String drink,
  String smoke,
  String martialStatus,
  String haveChildren,
  String noOfChildren,
  String proffesion,
  String employmentStatus,
  String income,
  String livingSituation,
  String willingToRelocate,
  String relationshipYouAreLookingFor,

  // cultural values
  String nationality,
  String education,
  String languageSpoken,
  String religion,
  String ethnicity,

  )async

 {
  try
  {
      // 1. Authenticate User with email ans password

      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
        
        );

        // 2. Upload image to storage
        String urlOfDownloadImage = await uploadImageToStorage(imageProfile);

        // 3. save user info to firebase database

        personModel.Person personInstance = personModel.Person(
          
           // personal info
           imageProfile: urlOfDownloadImage,
           email: email,
           password: password,
           name: name,
           age: int.parse(age),
           phoneNo: phoneNo,
           city: city,
           country: country,
           profileHeading: profileHeading,
           lookingForInaPartner: lookingForInaPartner,
           publishedDateTime: DateTime.now().millisecondsSinceEpoch,
          
          // appereance
           height: height,
           weight: weight,
           bodyType: bodyType,

           // life style

           drink: drink,
           smoke: smoke,
           martialStatus: martialStatus,
           haveChildren: haveChildren,
           noOfChildren: noOfChildren,
           proffesion: proffesion,
           employmentStatus: employmentStatus,
           income: income,
           livingSituation: livingSituation,
           willingToRelocate: willingToRelocate,
           relationshipYouAreLookingFor: relationshipYouAreLookingFor,

           // background - cultural values
           nationality: nationality,
           education: education,
           languageSpoken: languageSpoken,
           religion: religion,
           ethnicity: ethnicity,


        );

        await FirebaseFirestore.instance.collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(personInstance.toJson());

        Get.snackbar("Account Created", "Congratulation, your account has been created. ");
        Get.to(HomeScreen());
  }
  catch(errorMsg)
  {
    Get.snackbar("Account Creation Unsuccessful", "Error occurred: $errorMsg");
  }
 }

}

