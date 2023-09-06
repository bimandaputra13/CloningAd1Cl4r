import 'package:flutter/material.dart';
import '/HomePage/homePage.dart';


@override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/tabBar': (context) => MyHomePage(),
      },
    );
  }


class SignUpScreen extends StatelessWidget {
  const SignUpScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg-adira.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: const Center(
          child: SizedBox(
            width: 400,
            child: Card(
              //color: Color.fromARGB(255, 151, 151, 151),
              child: SignUpForm(),
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm();

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  //final _usernameTxt = TextEditingController();
  final _txtNik = TextEditingController();
  final _txtPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  

  @override
  Widget build(BuildContext context) {
    return Card(
      //onChanged: _updateFormProgress,
      child: SizedBox(
        height: 200,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        _usernameWidget(),
                        _passwordWidget(),
                        SizedBox(height: 20),
                        Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _submitButton(context),
                                _clearButton(context),
                              ]),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Column(children: [
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.resolveWith(
                              (Set<MaterialState> states) {
                            return states.contains(MaterialState.disabled)
                                ? null
                                : Color.fromARGB(255, 255, 252, 252);
                          }),
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (Set<MaterialState> states) {
                            return states.contains(MaterialState.disabled)
                                ? null
                                : Color.fromARGB(255, 255, 255, 255);
                          }),
                        
                        ),
                        //onPressed: _formProgress == 1 ?  _showWelcomeScreen: null,
                        onPressed: () {
                          Navigator.pushNamed(context, '/tabBar');
                          
                          //_formProgress == 1 ?  _showWelcomeScreen: null;
                        },
                        child: const Text('Lupa Password ???',style: TextStyle(fontSize: 9, color: Colors.black),),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            //Positioned(top: 60, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }

  // void _updateFormProgress() {
  //   var progress = 0.0;
  //   final controllers = [
  //     _usernameTxt,
  //     _usernameTxt,
  //   ];

  //   for (final controller in controllers) {
  //     if (controller.value.text.isNotEmpty) {
  //       progress += 1 / controllers.length;
  //     }
  //   }

  // }

  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      //If all data are correct then save data to out variables
      _formKey.currentState!.save();
      //doLogin(txtEditEmail.text, txtEditPwd.text);
      _submitButton(context);
    }
  }
}

Widget _submitButton(BuildContext context) {
  return Align(
    alignment: Alignment.center,
    child: InkWell(
       onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyHomePage()));
       },
      child:
          //Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          ElevatedButton(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            return states.contains(MaterialState.disabled)
                ? null
                : Color.fromARGB(255, 255, 252, 252);
          }),
          backgroundColor:
              MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            return states.contains(MaterialState.disabled)
                ? null
                : Color.fromARGB(255, 65, 65, 66);
          }),
          alignment: Alignment.center,
        ),
        //onPressed: _formProgress == 1 ?  _showWelcomeScreen: null,
        onPressed: () {
          //_SignUpFormState()._validateInputs();
          Navigator.pushNamed(context, '/tabBar');
        },
        child: const Text('Login'),
      ),
    ),
  );
}



Widget _clearButton(BuildContext context) {
  return Align(
    alignment: Alignment.center,
    child: InkWell(
      // onTap: () {
      //   // Navigator.push(
      //   //     context, MaterialPageRoute(builder: (context) => SignUpPage()));
      // },
      child:
          //Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          ElevatedButton(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            return states.contains(MaterialState.disabled)
                ? null
                : Color.fromARGB(255, 255, 252, 252);
          }),
          backgroundColor:
              MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            return states.contains(MaterialState.disabled)
                ? null
                : Color.fromARGB(255, 65, 65, 66);
          }),
          alignment: Alignment.center,
        ),
        //onPressed: _formProgress == 1 ?  _showWelcomeScreen: null,
        onPressed: () {
          Navigator.pushNamed(context, '/tabBar');
          //_formProgress == 1 ?  _showWelcomeScreen: null;
        },
        child: const Text('Clear'),
      ),
    ),
  );
}

Widget _usernameWidget() {
  return Stack(
    children: [
      TextFormField(
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: 'NIK',
          labelStyle: TextStyle(
              color: Color.fromRGBO(172, 172, 172, 1),
              fontWeight: FontWeight.bold),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(173, 183, 192, 1)),
          ),
        ),
      ),
    ],
  );
}

Widget _passwordWidget() {
  return Stack(
    children: [
      TextFormField(
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        obscureText: true,
        validator: (String? arg) {
        if (arg == null || arg.isEmpty) {
          return 'Password harus diisi';
        } else {
          return null;
        }
      },
        decoration: const InputDecoration(
          labelText: 'Password',
          labelStyle: TextStyle(
              color: Color.fromRGBO(172, 172, 172, 1),
              fontWeight: FontWeight.bold),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(173, 183, 192, 1)),
          ),
        ),
      ),
    ],
  );
}



