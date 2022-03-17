import 'dart:math';

import 'package:datainfoapp/model/dataInfo.dart';
import 'package:datainfoapp/providers/dataInfo_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  DateTime valueDate = DateTime.now();
  DateTime? dateTime;

  final formKey = GlobalKey<FormState>();
//ข้อมูลส่วนตัว
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final idCardController = TextEditingController();
  final birthdayController = TextEditingController();
  final telController = TextEditingController();

//ที่อยู่
  final villagenameController = TextEditingController();
  final housenumberController = TextEditingController();
  final soiController = TextEditingController();
  final roadController = TextEditingController();
  final subdistrictController = TextEditingController();
  final districtController = TextEditingController();
  final provincectController = TextEditingController();
  final zipcodeController = TextEditingController();

  String randomID() {
    var number = 0;
    var rng = Random();
    number = rng.nextInt(100000);
    print(number);
    return number.toString();
  }

  Future<DateTime?> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime ?? initialDate,
      firstDate: DateTime(1970, 1),
      lastDate: DateTime(2101),
    );

    if (newDate == null) {
      return null;
    } else {
      birthdayController.text = DateFormat('dd/MM/yyyy').format(newDate);
      // print(newDate);
    }

    return newDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ข้อมูล'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'ข้อมูลส่วนตัว',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ชื่อ-นามสกุล'),
                  autofocus: false,
                  controller: nameController,
                  validator: (String? name) {
                    if (name!.isEmpty) {
                      return 'กรุณากรอกชื่อ-นามสกุล';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'เลขบัตรประชาชน'),
                  keyboardType: TextInputType.number,
                  controller: idCardController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'กรุณากรอกเลขบัตรประชาชน';
                    }
                    if (value.length != 13) {
                      return 'กรุณากรอกข้อมูลเลขบัตรประชาชนให้ถูกต้อง';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'วัน/เดือน/ปีเกิด'),
                  autofocus: false,
                  controller: birthdayController,
                  onTap: () async {
                    pickDate(context);
                  },
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'กรุณากรอก วัน/เดือน/ปีเกิด';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'อายุ'),
                  keyboardType: TextInputType.number,
                  controller: ageController,
                  validator: (String? age) {
                    if (age!.isEmpty) {
                      return 'กรุณากรอกอายุ';
                    }
                    if (int.parse(age) <= 0) {
                      return 'กรุณากรอกข้อมูลให้ถูกต้อง';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'เบอร์โทร'),
                  controller: telController,
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'กรุณากรอกเบอร์โทร';
                    }

                    return null;
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'ที่อยู่ตามบัตรประชาชน',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'หมู่บ้าน'),
                          controller: villagenameController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'กรุณากรอกชื่อหมู่บ้าน';
                            }

                            return null;
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'บ้านเลขที่'),
                          controller: housenumberController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'กรุณากรอกบ้านเลขที่';
                            }

                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: TextFormField(
                          decoration: const InputDecoration(labelText: 'ซอย'),
                          controller: soiController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'กรุณากรอกซอย';
                            }

                            return null;
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: TextFormField(
                          decoration: const InputDecoration(labelText: 'ถนน'),
                          controller: roadController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'กรุณากรอกถนน';
                            }

                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'แขวง/ตำบล'),
                          controller: subdistrictController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'กรุณากรอกแขวง/ตำบล';
                            }

                            return null;
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'เขต/อำเภอ'),
                          controller: districtController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'กรุณากรอกเขต/อำเภอ';
                            }

                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(right: 5),
                        child: TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'จังหวัด'),
                          controller: provincectController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'กรุณากรอกจังหวัด';
                            }

                            return null;
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'รหัสไปรษณีย์'),
                          keyboardType: TextInputType.number,
                          controller: zipcodeController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'กรุณากรอกรหัสไปรษณีย์';
                            }

                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Center(
                  child: FlatButton(
                    child: const Text(
                      'บันทึก',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    color: Colors.green,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        var name = nameController.text;
                        var age = ageController.text;

                        DataInfo newdata = DataInfo(
                          id: randomID(),
                          name: name,
                          age: int.parse(age),
                          idCard: idCardController.text,
                          birthday: birthdayController.text,
                          tel: telController.text,
                          villageName: villagenameController.text,
                          houseNumber: housenumberController.text,
                          soi: soiController.text,
                          road: roadController.text,
                          subdistrict: subdistrictController.text,
                          district: districtController.text,
                          province: provincectController.text,
                          zipcode: zipcodeController.text,
                          dateCreate: DateTime.now(),
                        );
                        var provider = Provider.of<DataInfoProvider>(context,
                            listen: false);
                        provider.addDataInfo(newdata);

                        // print('name : $name');
                        // print('age : $age');
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
