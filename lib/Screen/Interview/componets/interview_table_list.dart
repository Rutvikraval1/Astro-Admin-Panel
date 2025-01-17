import 'package:flutter/material.dart';

import '../../../widget/button/custom_outline_button.dart';
import '../../../widget/button/navigate_btn.dart';

class common_interview_table extends StatelessWidget {
  List heading_data;
  List row_data;
  Function view_ontap;
  Function approve_ontap;
  common_interview_table(
      {super.key,required this.approve_ontap, required this.view_ontap ,required this.heading_data, required this.row_data});

  @override
  Widget build(BuildContext context) {
    return DataTable(
        dataRowColor: MaterialStateProperty.all(Colors.white),
        headingRowColor: MaterialStateProperty.all(const Color(0xffFF9933)),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        headingTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),

        headingRowHeight: 45,
        dataTextStyle: const TextStyle(
          color: Color(0xFF5C5C5C),
          fontSize: 11,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        dataRowHeight: 100,
        // horizontalMargin: 60,
        columns: [
          for (int i = 0; i < heading_data.length; i++)
            DataColumn(
              label: Text(heading_data[i], overflow: TextOverflow.ellipsis),
            ),
        ],

        rows: [
          if (row_data.isNotEmpty)
            for (int i = 0; i < 6; i++)
              DataRow(cells: [
                for (int i = 0; i < row_data.length; i++)
                    DataCell(row_data[i] == 'action'?Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 86,
                          child: NavigateBtn(
                            onPressed: () {
                              view_ontap();
                            },
                            text: 'View',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 86,
                          child: custom_outlined_button(
                            onPressed: () {
                              approve_ontap();
                            },
                            text: 'Approve',
                          ),
                        )
                      ],
                    ):Text(row_data[i])),



              ]),
          // DataRow(cells: [
          //     DataCell(Column(
          //       children: [
          //         NavigateBtn(onPressed: (){},text: 'View',),
          //         SizedBox(height: 10,),
          //         custom_outlined_button(onPressed: (){},text: 'View',)
          //       ],
          //     )),
          // ])
        ]);
  }
}
