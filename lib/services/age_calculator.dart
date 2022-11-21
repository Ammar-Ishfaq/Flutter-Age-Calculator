import 'package:age/age.dart';

class AgeCalculator {
  //calculate age of a person
  AgeDuration calculateAge(DateTime today, DateTime birthDay) {
    AgeDuration age;
    age = Age.dateDifference(
        fromDate: birthDay, toDate: today, includeToDate: false);
    return age;
  }

//calculate next birthday of the person
  AgeDuration calculateNextBirthday(DateTime today, DateTime birthDay) {
    AgeDuration age;
    age = Age.dateDifference(
        fromDate: birthDay, toDate: today, includeToDate: false);
    return age;
  }
}
