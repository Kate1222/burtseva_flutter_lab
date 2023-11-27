import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:input_quantity/input_quantity.dart';

class FuelScreen extends StatefulWidget {
  final String title;

  const FuelScreen({super.key, required this.title});

  @override
  State<FuelScreen> createState() => _FuelScreenState();
}

class _FuelScreenState extends State<FuelScreen> {
  int countFuel = 0;
  double costFuel = 0;

  int buyFuelValue = 0;
  double calculateCostValue = 0;

  int userCountBonuses = 0;
  int userSelectCountBonuses = 0;

  Future<void> getData() async {
    final dataFuel = await FirebaseFirestore.instance
        .collection('fuels')
        .doc(widget.title)
        .get();
    final dataUser = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (dataFuel['limit'] == 0) {
      setState(() {
        countFuel = dataFuel['count'];
      });
    } else if (dataFuel['count'] < dataFuel['limit']) {
      setState(() {
        countFuel = dataFuel['count'];
      });
    } else {
      setState(() {
        countFuel = dataFuel['limit'];
      });
    }
    setState(() {
      costFuel = double.parse(dataFuel['cost'].toString());
      userCountBonuses = dataUser['bonuses'];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  //calculate cost function
  void calculateCost() {
    setState(() {
      calculateCostValue = buyFuelValue * costFuel;
      if (buyFuelValue != 0 && userSelectCountBonuses != 0) {
        calculateCostValue -= userSelectCountBonuses;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          widget.title,
          style: GoogleFonts.raleway(
              fontWeight: FontWeight.w700, fontSize: 36, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: ListView(
          primary: false,
          shrinkWrap: true,
          children: [
            //message text
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              child: Text(
                'After bought more, than 15 litters you get 1 bonus, for each litter!\n1 bonus = to 1 UAH!',
                style: GoogleFonts.raleway(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.yellow,
                ),
              ),
            ),
            //display max bought value
            Center(
              child: Text(
                'Max bought value: $countFuel litres',
                style: GoogleFonts.raleway(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //display cost fuel
            Center(
              child: Text(
                'Cost for 1 liter: $costFuel UAH',
                style: GoogleFonts.raleway(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //number field for count fuel
            Center(
              child: InputQty.int(
                minVal: 0,
                initVal: 0,
                maxVal: countFuel,
                onQtyChanged: (value) {
                  buyFuelValue = value;
                  calculateCost();
                },
                messageBuilder: (minVal, maxVal, value) => Text(
                  "Fuel count",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                qtyFormProps: const QtyFormProps(cursorColor: Colors.black),
                decoration: const QtyDecorationProps(
                  qtyStyle: QtyStyle.btnOnRight,
                  width: 25,
                  constraints: BoxConstraints(minWidth: 200, maxWidth: 200),
                  fillColor: Colors.white,
                  isBordered: false,
                  borderShape: BorderShapeBtn.square,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //display count user bonuses
            Center(
              child: Text(
                'Bonuses count: $userCountBonuses',
                style: GoogleFonts.raleway(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //number field for user bonuses
            Center(
              child: InputQty.int(
                initVal: 0,
                minVal: 0,
                maxVal: userCountBonuses,
                onQtyChanged: (value) {
                  userSelectCountBonuses = value;
                  calculateCost();
                },
                messageBuilder: (minVal, maxVal, value) => Text(
                  "Bonus count",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                qtyFormProps: const QtyFormProps(cursorColor: Colors.black),
                decoration: const QtyDecorationProps(
                  qtyStyle: QtyStyle.btnOnRight,
                  width: 25,
                  constraints: BoxConstraints(minWidth: 200, maxWidth: 200),
                  fillColor: Colors.white,
                  isBordered: false,
                  borderShape: BorderShapeBtn.square,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //display calculate cost
            Center(
              child: Text(
                'It will cost: $calculateCostValue UAH',
                style: GoogleFonts.raleway(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            //buy button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: IconButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('fuels')
                      .doc(widget.title)
                      .update({'count': countFuel - buyFuelValue}); //update count fuel

                  userCountBonuses -= userSelectCountBonuses;

                  if (buyFuelValue >= 15) {
                    userCountBonuses += buyFuelValue - 14;
                  }

                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .update({
                    'bonuses': userCountBonuses}); //update user bonuses count

                  Navigator.pop(context); //back to previous screen

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Successful sold!'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                icon: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.white),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Buy!',
                      style: GoogleFonts.raleway(
                          fontSize: 32, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
