import 'package:datainfoapp/model/dataInfo.dart';
import 'package:datainfoapp/providers/dataInfo_provider.dart';
import 'package:datainfoapp/screens/detail_screen.dart';
import 'package:datainfoapp/screens/form_screen.dart';
import 'package:datainfoapp/screens/stepper_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<DataInfoProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: const Text('App Data Info'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
      body: Consumer(
        builder: (context, DataInfoProvider provider, child) {
          var count = provider.datainfoList.length;
          if (count <= 0) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/browser.png',
                    width: 150,
                    height: 150,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'ไม่พบข้อมูล',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 20),
                  )
                ],
              ),
            );
          } else {
            return ListView.builder(
                itemCount: count,
                itemBuilder: (context, int index) {
                  DataInfo data = provider.datainfoList[index];
                  return InkWell(
                    child: Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 5),
                      child: ListTile(
                        leading: const CircleAvatar(
                          radius: 30,
                          // child: FittedBox(
                          //   child: Text(data.age.toString()),
                          // ),
                          backgroundImage: AssetImage('assets/images/user.png'),
                        ),
                        title: Text(
                          '${data.name}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          DateFormat('dd-MM-yyyy HH:mm:ss')
                              .format(data.dateCreate!),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                              fontSize: 14),
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        Provider.of<DataInfoProvider>(context, listen: false)
                            .initDataDetail(data.id.toString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(rowid: data.id.toString()),
                          ),
                        );
                      });
                    },
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const StepperFormScreen();
              // return FormScreen();
            }),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
