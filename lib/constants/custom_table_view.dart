import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perfect_computer/constants/app_colors.dart';

class CustomTableView extends StatelessWidget {
  final List<TableHeader> header;
  final List<CustomTableCell> cells;

  const CustomTableView({super.key, required this.header, required this.cells});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Scrollbar(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: customTableView(),
          ),
        ),
      ),
    );
  }

  List<Widget> customTableView() {
    if (header.length != cells.first.row.length) {
      return [
        const Center(
          child: Text(
            'Table header and table cell length both are differnt',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        )
      ];
    }

    for (var i = 0; i < cells.length; i++) {
      for (var j = 0; j < cells[i].row.length; j++) {
        cells[i].row[j].width = header[j].width!;
      }
    }

    return [
      IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: header
              .map(
                (e) => _getSingleHeader(
                    title: e.title, width: e.width, widget: e.widget),
              )
              .toList(),
        ),
      ),
      Expanded(
        child: Scrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: cells
                  .map((cell) => IntrinsicHeight(
                        child: Row(
                          children: cell.row
                              .map((row) => getDynamicCell(
                                  inputString: row.title,
                                  width: row.width,
                                  color: row.color ?? cell.color!,
                                  titleColor: row.titleColor,
                                  icon: row.icon))
                              .toList(),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    ];
  }

  Widget _getSingleHeader({
    required String title,
    double? width = 130,
    Widget? widget,
  }) {
    return widget != null
        ? Container(
            alignment: Alignment.center,
            color: AppColor.primaryColor,
            width: width,
            child: widget)
        : Container(
            margin: const EdgeInsets.symmetric(
              vertical: 0.5,
              horizontal: 0.5,
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10.0),
            color: AppColor.primaryColor,
            width: width,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.urbanist(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ));
  }

  Widget getDynamicCell({
    required String inputString,
    required Color color,
    double? width,
    Widget? icon,
    Color? titleColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 0.5,
        horizontal: 0.5,
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10.0),
      color: color,
      width: width ?? 130,
      child: icon ??
          Text(
            inputString,
            textAlign: TextAlign.center,
            style: GoogleFonts.urbanist(
              color: titleColor ?? Colors.black54,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
            ),
          ),
    );
  }
}

class TableHeader {
  String title;
  double? width;
  Widget? widget;

  TableHeader({required this.title, this.width = 130, this.widget});
}

class CustomTableCell {
  Color? color;
  List<TableDataRow> row;

  CustomTableCell({required this.row, this.color});
}

class TableDataRow {
  String title;
  double? width;
  Widget? icon;
  Color? color;
  Color? titleColor;

  TableDataRow(
      {required this.title,
      this.width,
      this.icon,
      this.color,
      this.titleColor});
}
