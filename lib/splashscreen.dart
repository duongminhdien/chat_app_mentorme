import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(74, 63, 105, 1),
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          //draw the chat bubble icon
          Expanded(
            flex: 11,
            child: Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.cover,
              //width: 416,
              //height: 416,
            ),
          ),

          //text in the SplashScreen
          const Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(right: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Simpliest',
                    style: TextStyle(
                        fontSize: 40,
                        //fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'GDS Transport Website'),
                  ),
                  Text(
                    'Video Call and ',
                    style: TextStyle(
                        fontSize: 40,
                        //fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'GDS Transport Website'),
                  ),
                  Text(
                    'Messaging App ',
                    style: TextStyle(
                        fontSize: 40,
                        //fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'GDS Transport Website'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // navigate to the main app screen here
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color.fromRGBO(74, 63, 105, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      //padding: const EdgeInsets.symmetric(
                      //horizontal: 100, vertical: 15),
                      minimumSize: const Size(327, 56),
                    ),
                    child: const Text(
                      'Get started',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //Navigate to the sign-in screen
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontSize: 16, fontFamily: 'GDS Transport Website'),
                  ),
                  child: RichText(
                    text: const TextSpan(
                      text: 'Already a member? ',
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'GDS Transport Website'),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
