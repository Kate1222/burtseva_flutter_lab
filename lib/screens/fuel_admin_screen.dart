import 'package:burtseva_flutter_lab/components/button.dart';
import 'package:burtseva_flutter_lab/functions/admin_set_fuel_data.dart';
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
            //display current fuel count
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
            //number field for count fuel
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
            //display current cost fuel
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
            //number field for cost fuel
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
            //display buy limit for fuel
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
            //number field for buy limit fuel
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
            //set button
            AzsButton(
              function: () {
                adminSetFuelData(
                  context,
                  widget.title,
                  newFuelCount,
                  newCost,
                  newLimit,
                );
              },
              label: 'Set!',
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
