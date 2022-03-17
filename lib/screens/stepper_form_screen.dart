import 'dart:math';

import 'package:datainfoapp/model/dataInfo.dart';
import 'package:datainfoapp/providers/dataInfo_provider.dart';
import 'package:datainfoapp/screens/home_screen.dart';
import 'package:datainfoapp/style/myStyle.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class StepperFormScreen extends StatefulWidget {
  const StepperFormScreen({Key? key}) : super(key: key);

  @override
  State<StepperFormScreen> createState() => _StepperFormScreenState();
}

class _StepperFormScreenState extends State<StepperFormScreen> {
  int _activeStepIndex = 0;
  DateTime valueDate = DateTime.now();
  DateTime? dateTime;

  final formKey_personalInfo = GlobalKey<FormState>();
  final formKey_address = GlobalKey<FormState>();
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

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text('ข้อมูลส่วนตัว'),
          content: SingleChildScrollView(
            child: Container(
              child: Form(
                key: formKey_personalInfo,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // margin: const EdgeInsets.only(top: 5),
                      child: const Text(
                        'ข้อมูลส่วนตัว',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'ชื่อ-นามสกุล'),
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
                  ],
                ),
              ),
            ),
          ),
        ),
        Step(
          state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title: const Text('ที่อยู่'),
          content: SingleChildScrollView(
            child: Container(
              child: Form(
                key: formKey_address,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        'ที่อยู่ตามบัตรประชาชน',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
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
                              decoration: const InputDecoration(
                                  labelText: 'บ้านเลขที่'),
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
                              decoration:
                                  const InputDecoration(labelText: 'ซอย'),
                              controller: soiController,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: TextFormField(
                              decoration:
                                  const InputDecoration(labelText: 'ถนน'),
                              controller: roadController,
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
                              decoration: const InputDecoration(
                                  labelText: 'รหัสไปรษณีย์'),
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
                  ],
                ),
              ),
            ),
          ),
        ),
        Step(
          state: StepState.complete,
          isActive: _activeStepIndex >= 2,
          title: const Text('ตรวจสอบข้อมูล'),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ข้อมูลส่วนตัว',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              MyStyle().detail(
                  'ชื่อ - นามสกุล',
                  nameController.text.toString() == 'null' ||
                          nameController.text.toString() == ''
                      ? '-'
                      : nameController.text),
              MyStyle().detail(
                  'เลขบัตรประชาชน',
                  idCardController.text.toString() == 'null' ||
                          idCardController.text.toString() == ''
                      ? '-'
                      : idCardController.text),
              MyStyle().detail(
                  'วัน/เดือน/ปีเกิด',
                  birthdayController.text.toString() == 'null' ||
                          birthdayController.text.toString() == ''
                      ? '-'
                      : birthdayController.text),
              MyStyle().detail(
                  'อายุ',
                  ageController.text.toString() == 'null' ||
                          ageController.text.toString() == ''
                      ? '-'
                      : ageController.text),
              MyStyle().detail(
                  'เบอร์โทร',
                  telController.text.toString() == 'null' ||
                          telController.text.toString() == ''
                      ? '-'
                      : telController.text),
              const SizedBox(height: 15),
              const Text(
                'ที่อยู่',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              MyStyle().detail(
                  'หมู่บ้าน',
                  villagenameController.text.toString() == 'null' ||
                          villagenameController.text.toString() == ''
                      ? '-'
                      : villagenameController.text),
              MyStyle().detail(
                  'บ้านเลขที่',
                  housenumberController.text.toString() == 'null' ||
                          housenumberController.text.toString() == ''
                      ? '-'
                      : housenumberController.text),
              MyStyle().detail(
                  'ซอย',
                  soiController.text.toString() == 'null' ||
                          soiController.text.toString() == ''
                      ? '-'
                      : soiController.text),
              MyStyle().detail(
                  'ถนน',
                  roadController.text.toString() == 'null' ||
                          roadController.text.toString() == ''
                      ? '-'
                      : roadController.text),
              MyStyle().detail(
                  'แขวง/ตำบล',
                  subdistrictController.text.toString() == 'null' ||
                          subdistrictController.text.toString() == ''
                      ? '-'
                      : subdistrictController.text),
              MyStyle().detail(
                  'เขต/อำเภอ',
                  districtController.text.toString() == 'null' ||
                          districtController.text.toString() == ''
                      ? '-'
                      : districtController.text),
              MyStyle().detail(
                  'จังหวัด',
                  provincectController.text.toString() == 'null' ||
                          provincectController.text.toString() == ''
                      ? '-'
                      : provincectController.text),
              MyStyle().detail(
                  'รหัสไปรษณีย์',
                  zipcodeController.text.toString() == 'null' ||
                          zipcodeController.text.toString() == ''
                      ? '-'
                      : zipcodeController.text),
            ],
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: const Text('ข้อมูล'),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: Colors.green),
        ),
        child: Stepper(
          type: StepperType.horizontal,
          currentStep: _activeStepIndex,
          steps: stepList(),
          onStepContinue: () {
            setState(() {
              final isLastStep = _activeStepIndex == stepList().length - 1;

              if (isLastStep) {
                if (formKey_personalInfo.currentState!.validate() ||
                    formKey_address.currentState!.validate()) {
                  var name = nameController.text;
                  var age = ageController.text;
                  var soi = soiController.text.toString() == 'null' ||
                          soiController.text.toString() == ''
                      ? '-'
                      : soiController.text.toString();
                  var road = roadController.text.toString() == 'null' ||
                          roadController.text.toString() == ''
                      ? '-'
                      : roadController.text.toString();
                  DataInfo newdata = DataInfo(
                    id: randomID(),
                    name: name,
                    age: int.parse(age),
                    idCard: idCardController.text.toString(),
                    birthday: birthdayController.text.toString(),
                    tel: telController.text.toString(),
                    villageName: villagenameController.text.toString(),
                    houseNumber: housenumberController.text.toString(),
                    soi: soi,
                    road: road,
                    subdistrict: subdistrictController.text.toString(),
                    district: districtController.text.toString(),
                    province: provincectController.text.toString(),
                    zipcode: zipcodeController.text.toString(),
                    dateCreate: DateTime.now(),
                  );
                  var provider =
                      Provider.of<DataInfoProvider>(context, listen: false);
                  provider.addDataInfo(newdata);

                  Navigator.pop(context);
                }
              }
              // else {
              //   _activeStepIndex += 1;
              //   print(_activeStepIndex);
              // }
              if (_activeStepIndex == 0) {
                if (formKey_personalInfo.currentState!.validate()) {
                  _activeStepIndex += 1;
                } else {
                  _activeStepIndex = 0;
                  print(_activeStepIndex);
                }
              }
              // if (_activeStepIndex == 1) {
              //     _activeStepIndex += 1;
              //   if (formKey_address.currentState!.validate()) {
              //     _activeStepIndex += 1;
              //   } else {
              //     _activeStepIndex = 1;
              //     print(_activeStepIndex);
              //   }
              // }

              if (_activeStepIndex < (stepList().length - 1)) {
                _activeStepIndex += 1;
                print(_activeStepIndex);
              }
            });
          },
          onStepCancel: () {
            if (_activeStepIndex == 0) {
              return;
            }
            _activeStepIndex -= 1;
            print(_activeStepIndex);
            setState(() {});
          },
          onStepTapped: (step) {
            setState(() {
              _activeStepIndex = step;
            });
          },
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            final isLastStep = _activeStepIndex == stepList().length - 1;
            return Container(
              margin: const EdgeInsets.only(top: 50),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: details.onStepContinue,
                          child: Text(isLastStep ? 'บันทึก' : 'ถัดไป'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: details.onStepCancel,
                          child: const Text('กลับ'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ]),
            );
          },
        ),
      ),
    );
  }
}
