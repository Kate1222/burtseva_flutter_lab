import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:input_quantity/input_quantity.dart';

class FuelAdminScreen extends StatefulWidget {
  final String title;
  final dynamic data;

  const FuelAdminScreen({super.key, required this.title, required this.data});

  @override
  State<FuelAdminScreen> createState() => _FuelAdminScreenState();
}

class _FuelAdminScreenState extends State<FuelAdminScreen> {
  @override
  Widget build(BuildContext context) {
    int countFuel = widget.data['count'];
    double costFuel = double.parse(widget.data['cost'].toString());
    int limitFuel = widget.data['limit'];

    int newFuelCount = countFuel;
    double newCost = costFuel;
    int newLimit = limitFuel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          '${widget.title} Admin',
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
            Center(
              child: Text(
                'Current fuel value: $countFuel litres',
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
            Center(
              child: InputQty.int(
                minVal: 0,
                initVal: countFuel,
                //maxVal: countFuel,
                onQtyChanged: (value) {
                  newFuelCount = value;
                },
                messageBuilder: (minVal, maxVal, value) => Text(
                  "New fuel count",
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
            Center(
              child: InputQty.double(
                minVal: 0,
                initVal: costFuel,
                //maxVal: countFuel,
                onQtyChanged: (value) {
                  newCost = value;
                },
                messageBuilder: (minVal, maxVal, value) => Text(
                  "New cost",
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
            Center(
              child: Text(
                'Current fuel limit: $limitFuel litres',
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
            Center(
              child: InputQty.int(
                minVal: 0,
                initVal: limitFuel,
                //maxVal: countFuel,
                onQtyChanged: (value) {
                  newLimit = value;
                },
                messageBuilder: (minVal, maxVal, value) => Text(
                  "New fuel limit",
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: IconButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('fuels')
                      .doc(widget.title)
                      .update({'count': newFuelCount});
                  FirebaseFirestore.instance
                      .collection('fuels')
                      .doc(widget.title)
                      .update({'cost': newCost});
                  FirebaseFirestore.instance
                      .collection('fuels')
                      .doc(widget.title)
                      .update({'limit': newLimit});
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Successful changed!'),
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
                      'Set!',
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
