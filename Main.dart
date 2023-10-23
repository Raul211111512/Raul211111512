import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/home.dart';
import 'pages/account.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFD3B398)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Perpustakaan Elektronik'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool _isLoggedIn = false;

  List <Widget> pages = <Widget>[
    Home(),
    Account()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onSubmitButtonPressed() {
    setState(() {
      _isLoggedIn = true;
    });
  }

  Widget createLoginPage()
  {
    // Style needs to be constant as child of TextFormField
    Widget loginPage = 

      Padding(
        padding: EdgeInsets.all(10.0), 
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Login', textAlign: TextAlign.start, style: GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: 30.0)),
            Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Text('Nomor Anggota', style: GoogleFonts.montserrat())
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ]
              )
            ),
            Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Text('Password', style: GoogleFonts.montserrat())
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ]
              )
            ),
            Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: ElevatedButton(
                onPressed: _onSubmitButtonPressed,
                child: Text('Submit', style: GoogleFonts.montserrat())
              ), 
            ),
            const Divider(),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Text(
                'Registrasi Anggota', 
                textAlign: TextAlign.start, 
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: 30.0)
              )
            ),
            Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Text('Nomor Anggota', style: GoogleFonts.montserrat())
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ]
              )
            ),
            Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Text('Nama Lengkap', style: GoogleFonts.montserrat())
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ]
              )
            ),
            Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Text('Password', style: GoogleFonts.montserrat())
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ]
              )
            ),
            Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: ElevatedButton(
                onPressed: _onSubmitButtonPressed,
                child: Text('Submit', style: GoogleFonts.montserrat())
              ), 
            ),
          ]
        )
      )
    );
    return loginPage;
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, textAlign: TextAlign.center, style: GoogleFonts.montserrat( fontWeight: FontWeight.w700)),
      ),
      body: Container(
        child: _isLoggedIn ? pages.elementAt(_selectedIndex) : createLoginPage()
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account'
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
