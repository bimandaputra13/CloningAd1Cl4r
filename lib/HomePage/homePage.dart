import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flexible_tree_view/flexible_tree_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ad1clar',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  get _showLines => false;

  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title,style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.bold, fontFamily: 'Kanit', fontSize: 25)),
      //   backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      //   centerTitle: true,
      // ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 0, 0, 0)),
          onPressed: null,
        ),
        title: const Text('Selamat Datang di Adira Finance',
            style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
                fontFamily: 'Kanit',
                fontSize: 25),
            textAlign: TextAlign.center),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'Log Out',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Harusnya Balik ke login page')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Next page'),
                    ),
                    body: const Center(
                      child: Text(
                        'This is the next page',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ));
            },
          ),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: sideMenu,
            style: SideMenuStyle(
              // showTooltip: false,
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Color.fromARGB(255, 172, 172, 172),
              selectedHoverColor: Color.fromARGB(255, 191, 191, 191),
              selectedColor: Color.fromARGB(255, 42, 42, 41),
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              backgroundColor: Colors.yellow[600],
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              // ),
              // backgroundColor: Colors.blueGrey[700]
            ),
            title: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 150,
                    maxWidth: 150,
                  ),
                  child: Image.asset(
                    'assets/images/adiraLogo.png',
                  ),
                ),
                const Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            footer: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  //   decoration: BoxDecoration(
                  //       color: Color.fromARGB(255, 49, 67, 75),
                  //       borderRadius: BorderRadius.circular(12)),
                  //   child: Padding(
                  //     padding:
                  //         const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  //     child: Text(
                  //       'mohada',
                  //       style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                  //     ),
                  //   ),
                  ),
            ),
            items: [
              
              SideMenuItem(
                
                title: 'Home',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.home),
              ),
              SideMenuItem(
                title: 'Management Commercial Fleet',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                
                icon: const Icon(Icons.menu_book_rounded),
              ),
              SideMenuItem(
                title: 'Manajemen Sistem',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.account_circle_sharp),
              ),
              SideMenuItem(
                title: 'Manajemen Collection',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.collections),
              ),
              SideMenuItem(
                builder: (context, displayMode) {
                  return const Divider(
                    endIndent: 8,
                    indent: 8,
                  );
                },
              ),
              SideMenuItem(
                title: 'Manajemen Recovery',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.restart_alt_rounded),
              ),
              const SideMenuItem(
                title: 'Manajemen Warehouse',
                icon: Icon(Icons.warehouse),
              ),
              const SideMenuItem(
                title: 'Riwayat Pembayaran',
                icon: Icon(Icons.history),
              ),
              const SideMenuItem(
                title: 'FAQ',
                icon: Icon(Icons.menu_rounded),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              
              controller: pageController,
              children: [
                Container(
                   color: Colors.white,
                   child: const Center(
                     child: Text(
                       'Home',
                       style: TextStyle(fontSize: 35),
                     ),
                   ),
                ),

                TextButton(onPressed: (){Navigator.pushNamed(context, '/');} , child: Text('WorkflowCommercial Fleet')),
                // Container(
                //   color: Colors.white,
                //   child: const Center(
                //     child: Text(
                //       'Manajemen Commercial Fleet',
                //       style: TextStyle(fontSize: 35),
                //     ),
                //   ),
                // ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Manajemen Sistem',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Download',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Settings',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Only Title',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Only Icon',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

 _buildExpandableContent(Vehicle vehicle) {
    List<Widget> columnContent = [];

    for (String content in vehicle.contents)
      columnContent.add(
        ListTile(
          title: Text(content, style: TextStyle(fontSize: 18.0),),
          leading: Icon(vehicle.icon),
        ),
      );

    return columnContent;
  }


 class Vehicle {
  final String title;
  List<String> contents = [];
  final IconData icon;

  Vehicle(this.title, this.contents, this.icon);
}

List<Vehicle> vehicles = [
  Vehicle(
    'Bike',
    ['Vehicle no. 1', 'Vehicle no. 2', 'Vehicle no. 7', 'Vehicle no. 10'],
    Icons.motorcycle,
  ),
  Vehicle(
    'Cars',
    ['Vehicle no. 3', 'Vehicle no. 4', 'Vehicle no. 6'],
    Icons.directions_car,
  ),
];

 