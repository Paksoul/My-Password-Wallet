import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pm/homepage_screen.dart';
import 'package:pm/list_screen.dart';

class SignupProvider with ChangeNotifier{
  bool _isLoading = false;
  bool get isLoading => _isLoading;



  Future<void> saveData(
      BuildContext context,
      TextEditingController accountName,
      TextEditingController email,
      TextEditingController password,
      ) async {
    if (email.text == '') {
      _isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please provide your account Username.'),
          backgroundColor: Colors.red,
        ),
      );
    } else if (password.text == '') {
      _isLoading = false;
      notifyListeners();
      //////////////////Show Error if Password is Empty////////
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Provide the Password of your account.'),
          backgroundColor: Colors.red,
        ),
      );
    } else if (accountName.text == '') {
      _isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Provide the name of account, e.g. Facebook or Gmail etc'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      _isLoading = true;

      try {
        User? user = FirebaseAuth.instance.currentUser;
        await user?.reload(); // Reload user data to get updated info

        if (user != null) {
          FirebaseFirestore.instance
              .collection('passwords')
              .doc()
              .set({
            'User_Id': user.uid,
            'accountName': accountName.text.trim(),
            'accountEmail': email.text.trim(),
            'accountPassword':
            password.text.trim(),
          }).then((e) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ListScreen()));
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('You need to login first.'),
              backgroundColor: Colors.red,
            ),
          );
        }


      } catch (e) {
        _isLoading = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An unexpected error occurred. Please try again.'+e.toString()),
            backgroundColor: Colors.red,
          ),
        );
      }
    }

  }




  Future<void> login(
      BuildContext context,
      TextEditingController email,
      TextEditingController password,
      ) async {
    if (email.text == '') {
      _isLoading = false;
      notifyListeners();
      //////////////////Show Error if Email is Empty////////
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please provide your email.'),
          backgroundColor: Colors.red,
        ),
      );
    } else if (password.text == '') {
      _isLoading = false;
      notifyListeners();
      //////////////////Show Error if Password is Empty////////
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Provide a strong Password.'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      _isLoading = true;

      try {
        User? user = FirebaseAuth.instance.currentUser;
        await user?.reload(); // Reload user data to get updated info
        if (user == null) {

          user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: email.text, password: password.text))
              .user;

          Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>ListScreen()));
          _isLoading = false;
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User already Logged in.'),
              backgroundColor: Colors.red,
            ),
          );
          _isLoading = false;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ListScreen()));

        }


      } catch (e) {
        _isLoading = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An unexpected error occurred. Please try again.'+e.toString()),
            backgroundColor: Colors.red,
          ),
        );
      }
    }

  }




  Future<void> signup(
      BuildContext context,
      TextEditingController email,
      TextEditingController password,
      TextEditingController username,
      TextEditingController contact,
      ) async {

    if (contact.text == '') {
      //////////////////Show Error if Email is Empty////////
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please type your contact no.'),
          backgroundColor: Colors.red,
        ),
      );
    } else if (username.text == '') {
      //////////////////Show Error if Email is Empty////////
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please type your name.'),
          backgroundColor: Colors.red,
        ),
      );
    } else if (email.text == '') {
      //////////////////Show Error if Email is Empty////////
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please provide your email.'),
          backgroundColor: Colors.red,
        ),
      );
    } else if(password.text==''){
      //////////////////Show Error if Password is Empty////////
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Provide a strong Password.'),
          backgroundColor: Colors.red,
        ),
      );

    }
    else
    {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.text.trim(),
            password: password.text.trim());

        User? userID=FirebaseAuth.instance.currentUser;

        FirebaseFirestore.instance.collection('users').doc(userID!.uid).set({
        'name':username.text.trim(),
        'email':email.text.trim(),
        'contact':contact.text.trim(),
          'createdAt':Timestamp.now(),
        });
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomepageScreen()));
        ////////////////////////
        ///////////Show Success Message//////////
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration Successful!'),
            backgroundColor: Colors.green,
          ),
        );
        /////////////////Success Msg End/////////
        ////////////////////////////////////////
      } on FirebaseAuthException catch (e) {
        print(e.code);

        String message;
        print(e.code);
        if (e.code == 'weak-password') {
          message = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          message = 'The account already exists for that email.';
        } else {
          message = 'An error occurred. Please try again.';
        }

        ///////////////////////////////////////////
        //////////////////Show Error Message////////
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.red,
          ),
        );
        //////////////////////End Error Message/////////
        //////////////////////////////////////////////

      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An unexpected error occurred. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
  }

