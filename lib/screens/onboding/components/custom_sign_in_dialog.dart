import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive_animation/screens/onboding/components/sign_in_form.dart';

Future<Object?> customSigninDialog(BuildContext context, {required ValueChanged onClosed}) {
  return showGeneralDialog(
    //Let's close it while tap outside
    //Add the close btn at bottom
    barrierDismissible: true,
    barrierLabel: "Sign In",
    context: context,
    transitionDuration: Duration(milliseconds: 400),
    transitionBuilder: (_, animation, __,child){
      Tween<Offset> tween;
      tween = Tween(begin: Offset(0,-1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        ),
        child: child,
      );
    },
    pageBuilder: (context,_,__) => Center(
      child: Container(
        height: 620,
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.symmetric(
            vertical: 32, horizontal: 24
        ),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.94),
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  Text(
                    "Sign In",
                    style: TextStyle(
                        fontSize: 34, fontFamily: "Poppins"
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text("Don't settle for average. Bring your best to the moment.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SignInForm(),
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "OR",
                          style: TextStyle(
                            color: Colors.black26,
                          ),
                        ),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text("Sign up with Email, Apple or Google",
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: (){},
                        icon: SvgPicture.asset("assets/icons/email_box.svg",
                          height: 64,
                          width: 64,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: (){},
                        icon: SvgPicture.asset("assets/icons/apple_box.svg",
                          height: 64,
                          width: 64,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: (){},
                        icon: SvgPicture.asset("assets/icons/google_box.svg",
                          height: 64,
                          width: 64,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: -48,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  ).then(onClosed);
}