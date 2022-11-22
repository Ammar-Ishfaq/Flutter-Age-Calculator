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
  AgeDuration calculateNextBirthday(DateTime today, DateTime birthday) {
    DateTime temp = DateTime(today.year, birthday.month, birthday.day);
    DateTime nextBirthday = temp.isBefore(today)
        ? Age.add(date: temp, duration: AgeDuration(years: 1))
        : temp;

    AgeDuration nextBirthdayDuration;
    nextBirthdayDuration =
        Age.dateDifference(fromDate: today, toDate: nextBirthday);
    return nextBirthdayDuration;
  }

  //calculate nextBirthday week day
  int nextBirthday(DateTime today, DateTime birthday) {
    DateTime temp = DateTime(today.year, birthday.month, birthday.day);
    DateTime nextBirthday = temp.isBefore(today)
        ? Age.add(date: temp, duration: AgeDuration(years: 1))
        : temp;

    return nextBirthday.weekday;
  }
}
