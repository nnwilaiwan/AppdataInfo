import 'dart:ui';

import 'package:datainfoapp/providers/dataInfo_provider.dart';
import 'package:datainfoapp/screens/home_screen.dart';
import 'package:datainfoapp/style/myStyle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({required this.rowid});

  final String rowid;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, DataInfoProvider provider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade700,
          title: const Text('รายละเอียด'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (provider.datainfoDetail.isNotEmpty)
                Container(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ข้อมูลส่วนตัว',
                        style: TextStyle(
                          color: Colors.blue.shade700,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      MyStyle().detail(
                        'ชื่อ - นามสกุล',
                        provider.datainfoDetail[0]['name'].toString() ==
                                    'null' ||
                                provider.datainfoDetail[0]['name'].toString() ==
                                    ''
                            ? '-'
                            : provider.datainfoDetail[0]['name'].toString(),
                      ),
                      MyStyle().detail(
                        'เลขบัตรประชาชน',
                        provider.datainfoDetail[0]['idCard'].toString() ==
                                    'null' ||
                                provider.datainfoDetail[0]['idCard']
                                        .toString() ==
                                    ''
                            ? '-'
                            : provider.datainfoDetail[0]['idCard'].toString(),
                      ),
                      MyStyle().detail(
                        'วัน/เดือน/ปีเกิด',
                        provider.datainfoDetail[0]['birthday'].toString() ==
                                    'null' ||
                                provider.datainfoDetail[0]['birthday']
                                        .toString() ==
                                    ''
                            ? '-'
                            : provider.datainfoDetail[0]['birthday'].toString(),
                      ),
                      MyStyle().detail(
                        'อายุ',
                        provider.datainfoDetail[0]['age'].toString() ==
                                    'null' ||
                                provider.datainfoDetail[0]['age'].toString() ==
                                    ''
                            ? '-'
                            : provider.datainfoDetail[0]['age'].toString(),
                      ),
                      MyStyle().detail(
                        'เบอร์โทร',
                        provider.datainfoDetail[0]['tel'].toString() ==
                                    'null' ||
                                provider.datainfoDetail[0]['tel'].toString() ==
                                    ''
                            ? '-'
                            : provider.datainfoDetail[0]['tel'].toString(),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'ที่อยู่',
                        style: TextStyle(
                          color: Colors.blue.shade700,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      MyStyle().detail(
                        'หมู่บ้าน',
                        provider.datainfoDetail[0]['villageName'].toString() ==
                                    'null' ||
                                provider.datainfoDetail[0]['villageName']
                                        .toString() ==
                                    ''
                            ? '-'
                            : provider.datainfoDetail[0]['villageName']
                                .toString(),
                      ),
                      MyStyle().detail(
                        'บ้านเลขที่',
                        provider.datainfoDetail[0]['houseNumber'].toString() ==
                                    'null' ||
                                provider.datainfoDetail[0]['houseNumber']
                                        .toString() ==
                                    ''
                            ? '-'
                            : provider.datainfoDetail[0]['houseNumber']
                                .toString(),
                      ),
                      MyStyle().detail(
                        'ซอย',
                        provider.datainfoDetail[0]['soi'].toString() ==
                                    'null' ||
                                provider.datainfoDetail[0]['soi'].toString() ==
                                    ''
                            ? '-'
                            : provider.datainfoDetail[0]['soi'].toString(),
                      ),
                          MyStyle().detail(
                        'ถนน',
                        provider.datainfoDetail[0]['road'].toString() ==
                                    'null' ||
                                provider.datainfoDetail[0]['road'].toString() ==
                                    ''
                            ? '-'
                            : provider.datainfoDetail[0]['road'].toString(),
                      ),
                      MyStyle().detail(
                        'แขวง/ตำบล',
                        provider.datainfoDetail[0]['subdistrict'].toString() ==
                                    'null' ||
                                provider.datainfoDetail[0]['subdistrict']
                                        .toString() ==
                                    ''
                            ? '-'
                            : provider.datainfoDetail[0]['subdistrict']
                                .toString(),
                      ),
                      MyStyle().detail(
                        'เขต/อำเภอ',
                        provider.datainfoDetail[0]['district'].toString() ==
                                    'null' ||
                                provider.datainfoDetail[0]['district']
                                        .toString() ==
                                    ''
                            ? '-'
                            : provider.datainfoDetail[0]['district'].toString(),
                      ),
                      MyStyle().detail(
                        'จังหวัด',
                        provider.datainfoDetail[0]['province'].toString() ==
                                    'null' ||
                                provider.datainfoDetail[0]['province']
                                        .toString() ==
                                    ''
                            ? '-'
                            : provider.datainfoDetail[0]['province'].toString(),
                      ),
                      MyStyle().detail(
                        'รหัสไปรษณีย์',
                        provider.datainfoDetail[0]['zipcode'].toString() ==
                                    'null' ||
                                provider.datainfoDetail[0]['zipcode']
                                        .toString() ==
                                    ''
                            ? '-'
                            : provider.datainfoDetail[0]['zipcode'].toString(),
                      ),
                      const SizedBox(height: 10),
                      const Divider(thickness: 1),
                      const SizedBox(height: 25),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              child: Text('ย้อนกลับ',
                                  style: TextStyle(
                                    color: Colors.blue.shade700,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
