import 'package:flutter/material.dart';

Widget daily(BuildContext context, String? time, String? temperature) {
  return Container(
    width: 65.85,
    height: 139,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    decoration: ShapeDecoration(
      gradient: LinearGradient(
        begin: const Alignment(0.26, -0.97),
        end: const Alignment(-0.26, 0.97),
        colors: [
          const Color.fromARGB(255, 197, 197, 197),
          const Color.fromARGB(255, 177, 177, 177).withOpacity(0)
        ],
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(
            width: 3,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color.fromARGB(164, 255, 255, 255)),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          time.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Circular Std',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://cdn-icons-png.flaticon.com/512/1163/1163661.png?w=826&t=st=1688715544~exp=1688716144~hmac=dbee39204b8f1b984eb5c95f3aefd66e95f7ec50163802bb70551da115957a29"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '$temperature\u1d52',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Circular Std',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
