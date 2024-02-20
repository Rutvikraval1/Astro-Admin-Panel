
import 'package:flutter/material.dart';

class admin_user_list extends StatelessWidget {
  const admin_user_list({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFB3B3B3)),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Admin user',
                  style: TextStyle(
                    color: Color(0xFF2B2B2B),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  width: 67,
                  height: 26,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xFFFF9933), Color(0xFFF6820E)],
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'ADD',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 24,),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) =>Column(children: [
              ListTile(
                leading: Container(
                  width: 51,
                  height: 51,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/51x51"),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
                title: Text(
                    'Vishal Kumar',
                    style: TextStyle(
                      color: Color(0xFFCF8E00),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    )),
                subtitle: Text(
                  'HR Head',
                  style: TextStyle(
                    color: Color(0xFFB5B5B5),
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )

            ]),)
        ],
      ),
    );
  }
}
