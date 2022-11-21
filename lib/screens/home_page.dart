import 'package:age/age.dart';
import 'package:flutter/material.dart';
import 'package:flutter_age_calculator_1/services/age_calculator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AgeDuration? _ageDuration;
  DateTime todayDate = DateTime.now();
  DateTime dob = DateTime(2000, 1, 1);
  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  Future<void> _selectTodayDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: todayDate,
        firstDate: dob,
        lastDate: DateTime(2101));
    if (picked != null && picked != todayDate) {
      setState(() {
        todayDate = picked;
      });
    }
  }

  Future<void> _selectDobDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: todayDate,
        firstDate: DateTime(1900),
        lastDate: todayDate);
    if (picked != null && picked != dob) {
      setState(() {
        dob = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _ageDuration = AgeCalculator().calculateAge(todayDate, dob);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
              width: double.maxFinite,
            ),
            const Text(
              "AGE Calculator",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Today",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                  Row(
                    children: [
                      Text(
                        "${todayDate.day} ${months[todayDate.month]} ${todayDate.year}",
                        style: const TextStyle(
                          color: Color(0xffCDDC39),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          _selectTodayDate(context);
                        },
                        child: const Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Date of birth",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                  Row(
                    children: [
                      Text(
                        "${dob.day} ${months[dob.month]} ${dob.year}",
                        style: const TextStyle(
                          color: Color(0xffCDDC39),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          _selectDobDate(context);
                        },
                        child: const Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 40),
              width: double.maxFinite,
              // height: 400,
              decoration: BoxDecoration(
                  color: const Color(0xff333333),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 200,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "AGE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "${_ageDuration?.years}",
                                  style: const TextStyle(
                                      color: Color(0xffCDDC39),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 76),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 13.0),
                                  child: Text(
                                    "YEARS",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "${_ageDuration?.months} months | ${_ageDuration?.days} days",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 170,
                        width: 1,
                        color: const Color(0xff999999),
                      ),
                      Container(
                        height: 200,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "NEXT BIRTHDAY",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                            Icon(
                              Icons.cake,
                              size: 55,
                              color: Color(0xffCDDC39),
                            ),
                            Text(
                              "Friday",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                            Text(
                              "2 months | 12 days",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 1,
                    width: double.maxFinite,
                    color: const Color(0xff999999),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "SUMMARY",
                      style: TextStyle(
                          color: Color(0xffcddc39),
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: const [
                            const Text(
                              "YEARS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "21",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 28),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              "MONTHS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "261",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 28),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              "WEEKS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "1137",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 28),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: const [
                            Text(
                              "DAYS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "7693",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 28),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              "HOURS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "191112",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 25),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              "MINUTES",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "11466720",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
