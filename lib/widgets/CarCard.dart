import 'package:fahisapp/screens/VehicleDetails.dart';
import 'package:fahisapp/widgets/DeleteDropDown.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
//import 'package:percent_indicator/circular_percent_indicator.dart';

//import 'DeleteDropDown.dart';

class CarCardTest extends StatelessWidget {
  final String comName;
  final String carModel;
  final String logo;
  final String latterPlate;
  final int numPlate;
  const CarCardTest({
    Key? key,
    required this.comName,
    required this.carModel,
    required this.logo,
    required this.latterPlate,
    required this.numPlate,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.97,
      child: Container(
        height: 370,
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Positioned(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xA6F2CDAD),
                        Color(0x4DF9D4B7),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: 350,
                  height: 300,
                ),
              ),
            ),
            Positioned(
              bottom: 215,
              left: 30,
              child: Text(
                comName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              bottom: 245,
              left: 30,
              child: Text(
                carModel,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: 85,
              bottom: 230,
              child: Image.asset(logo,height: 20,width: 20),
            ),
            Positioned(
              bottom: 100,
              right: 45,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  gradient: LinearGradient(
                    colors: [
                      Color(0x33FEC163),
                      Color(0xBFDE4313),
                    ],
                  ),
                ),
                height: 40,
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(0, 253, 229, 216),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) =>VehicleDetails(comName: comName, carModel: carModel, logo: logo, latterPlate: latterPlate, numPlate: numPlate) ,));
                  },
                  child: const Text(
                    "التفاصيل",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              right: 45,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  gradient: LinearGradient(
                    colors: [
                      Color(0x33FEC163),
                      Color(0xBFDE4313),
                    ],
                  ),
                ),
                height: 40,
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(0, 253, 229, 216),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Services');
                  },
                  child: const Text(
                    "الخدمات",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 160,
              left: 30,
              child: Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                decoration: BoxDecoration(
                  // color: Color.fromARGB(31, 130, 66, 66),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(),
                ),
                child: const Text(
                  "123-ABC",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 70,
              right: 30,
              // ignore: unnecessary_new
              child: new CircularPercentIndicator(
                radius: 40.0,
                lineWidth: 11.0,
                animation: true,
                percent: numPlate/100,
                center:  Text(
                  "${numPlate}.0%",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: const Color(0xBF854B3A),
              ),
            ),
            const Positioned(
              top: 150,
              right: 40,
              child: Text(
                "غير مكتمل",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              ),
            ),
            const Positioned(
              top: 30,
              right: 10,
              child: DropDownMenuFb1(
                menuList: [
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 243, 55, 45),
                      ),
                      title: Text('حذف'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
