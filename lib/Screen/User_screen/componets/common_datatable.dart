
import 'package:flutter/material.dart';


class common_datatable extends StatelessWidget {
  List heading_data;
  List row_data;
  common_datatable({super.key,required this.heading_data,required this.row_data});

  @override
  Widget build(BuildContext context) {
    return DataTable(
        dataRowColor: MaterialStateProperty.all(Colors.white),
        headingRowColor: MaterialStateProperty.all(const Color(0xffFF9933)),
        columnSpacing:60,
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
        headingTextStyle:  const TextStyle(
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
        columns:  [
          for(int i=0;i<heading_data.length;i++)
            DataColumn(
            label: Text(heading_data[i],overflow: TextOverflow.ellipsis),
            ),
        ],

        rows: [
          if(row_data.isNotEmpty)
            for(int i=0;i<6;i++)
             DataRow(cells: [
               for(int i=0;i<row_data.length;i++)
              DataCell(Text(row_data[i])),
            ])
          else
            DataRow(cells: [
              for(int i=0;i<heading_data.length;i++)
                DataCell(SizedBox(child:i==4? const Text('No Data Available'):null)),
            ])
        ]);
  }
}
