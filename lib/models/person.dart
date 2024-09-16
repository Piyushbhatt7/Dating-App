import 'package:cloud_firestore/cloud_firestore.dart';

class Person {
  // personal info
  
  String? imageProfile;
  String? email;
  String? password;
  String? name;
  int? age;
  String? phoneNo;
  String? city;
  String? country;
  String? profileHeading;
  String? lookingForInaPartner;
  int? publishedDateTime;

  // Apperance

  String? height;
  String? weight;
  String? bodyType;

  // Life Style

  String? drink;
  String? smoke;
  String? martialStatus;
  String? haveChildren;
  String? noOfChildren;
  String? proffesion;
  String? employmentStatus;
  String? income;
  String? livingSituation;
  String? willingToRelocate;
  String? relationshipYouAreLookingFor;

  // Background - Cultural Values


  String? nationality;
  String? education;
  String? languageSpoken;
  String? religion;
  String? ethnicity;


  
  
  Person({
    
    // personal info
    this.imageProfile,
    this.email,
    this.password,
    this.name,
    this.age,
    this.phoneNo,
    this.city,
    this.country,
    this.profileHeading,
    this.lookingForInaPartner,
    this.publishedDateTime,
    // Apperance
    this.height,
    this.weight,
    this.bodyType,
    // life style
    this.drink,
    this.smoke,
    this.martialStatus,
    this.haveChildren,
    this.noOfChildren,
    this.proffesion,
    this.employmentStatus,
    this.income,
    this.livingSituation,
    this.willingToRelocate,
    this.relationshipYouAreLookingFor,
    this.nationality,
    // background cultural values
    this.education,
    this.languageSpoken,
    this.religion,
    this.ethnicity,

  });

  static Person fromDataSnapshot(DocumentSnapshot snapshot){
     
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;

     return Person(
           
            // personal info           
            name: dataSnapshot["name"],
            email: dataSnapshot["email"],
            password: dataSnapshot["password"],
            imageProfile: dataSnapshot["imageProfile"],
            age: dataSnapshot["age"],
            phoneNo: dataSnapshot["phoneNo"],
            city: dataSnapshot["city"],
            country: dataSnapshot["country"],
            profileHeading: dataSnapshot["profileHeading"],
            lookingForInaPartner: dataSnapshot["lookingForInaPartner"],
            publishedDateTime: dataSnapshot["publishedDateTime"],
             // Apperance
            height: dataSnapshot["height"],
            weight: dataSnapshot["weight"],
            bodyType: dataSnapshot["bodyType"],
            // life style
            drink: dataSnapshot["drink"],
            smoke: dataSnapshot["martialStatus"],
            haveChildren: dataSnapshot["haveChildren"],
            noOfChildren: dataSnapshot["noOfChildren"],
            proffesion: dataSnapshot["proffesion"],
            employmentStatus: dataSnapshot["employmentStatus"],
            income: dataSnapshot["income"],
            livingSituation: dataSnapshot["livingSituation"],
            nationality: dataSnapshot["nationality"],
            // background cultural values
            education: dataSnapshot["education"],
            languageSpoken: dataSnapshot["languageSpoken"],
            religion: dataSnapshot["religion"],
            ethnicity: dataSnapshot["ethnicity"],

     );

  }

    Map<String, dynamic> toJson()=>{
       
       // personal info
       "name": name,
       "email": email,
       "password": password,
       "imageProfile": imageProfile,
       "age": age,
       "phoneNo": phoneNo,
       "city": city,
       "country": country,
       "profileHeading": profileHeading,
       "lookingForInaPartner": lookingForInaPartner,
       "publishedDateTime": publishedDateTime,

      // appereance
      "height": height,
       "weight": weight,
       "bodyType": bodyType,

       // lifestyle
       "martialStatus": martialStatus,
       "haveChildren": haveChildren,
       "noOfChildren": noOfChildren,
       "proffesion": proffesion,
       "employmentStatus": employmentStatus,
       "income": income,
       "livingSituation": livingSituation,
       "nationality": nationality,

       // background cultural values
       "education": education,
       "languageSpoken": languageSpoken,
       "religion": religion,
       "ethnicity": ethnicity,
      
    };

} 