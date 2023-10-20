import 'package:flutter/material.dart';
import '../mongodb.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool showPass = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void createAccount() async {
    const CollectionName = "users";
    var collection = db.collection(CollectionName);
    // print("Hello Before...");
    await collection.insertOne({
      "_id": newObjectID(),
      "username": usernameController.text.trim(),
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
    });
    Navigator.pop(context);
    // print("Hello After...");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFF003545), Color(0xFF0B5269), Color(0xFF00818A)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              const SizedBox(height: 70,),
              const Row(
                children: [
                  RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'Sign up',
                      style: TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 30,),
                  Column(
                    children: [
                      SizedBox(height: 20,),
                      Text('Our SignUp Page', style: TextStyle(color: Colors.white54, fontSize: 23),),
                      SizedBox(height: 4,),
                      Text('Using FireBase', style: TextStyle(color: Colors.white54, fontSize: 23),),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 80,),
              _buildTextField(emailController, 'Email', TextInputType.emailAddress),
              const SizedBox(height: 15,),
              _buildTextField(usernameController, 'Username', TextInputType.text),
              const SizedBox(height: 15,),
              _buildPasswordField(),
              const SizedBox(height: 30,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot Password?', style: TextStyle(color: Colors.white),),
                ],
              ),
              const SizedBox(height: 30,),
              _buildSignUpButton(),
              const SizedBox(height: 30,),
              Row(
                children: [
                  const Text('Already a User?', style: TextStyle(color: Colors.white54, fontSize: 17),),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Sign in', style: TextStyle(color: Colors.white, fontSize: 17),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText, TextInputType inputType) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      keyboardType: inputType,
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.white54),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white54,
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: passwordController,
      style: const TextStyle(color: Colors.white),
      obscureText: showPass,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.white54),
        ),
        suffixIcon: IconButton(
          icon: showPass ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
          color: Colors.white54,
          onPressed: () {
            setState(() {
              showPass = !showPass;
            });
          },
        ),
        hintText: 'Password',
        hintStyle: const TextStyle(color: Colors.white54),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: createAccount,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Row(
            children: [
              Text(
                'Ok',
                style: TextStyle(fontSize: 20, color: Color.fromRGBO(100, 204, 197, 1)),
              ),
              Icon(Icons.arrow_forward, color: Color.fromRGBO(100, 204, 197, 1)),
            ],
          ),
        ),
      ],
    );
  }
}
