import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../global/constants/styles/colors/colors.dart';


class AuthenticationService {
 signUpUser(String email, String password, BuildContext context) async {
    try {
      // Fetch the admin email from Firestore
      DocumentSnapshot adminDoc = await FirebaseFirestore.instance
          .collection('adminCredentials')
          .doc('admin')
          .get();
      String? adminEmail = adminDoc.get('email');

      // Check if the email matches the admin email
      if (email == adminEmail) {
        Fluttertoast.showToast(
          textColor: kWhite,
          gravity: ToastGravity.TOP,
          msg: 'Admin account already exists.',
          backgroundColor: kBlack,
        );
        throw Exception('Cannot create account with this email.');
      } else {
        // Proceed with user signup
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        // Store the user's role in Firestore
        await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
          'email': email,
          'role': 'user', // Automatically set as 'user'
        });

        // Navigate to user dashboard
        Navigator.pushNamedAndRemoveUntil(context, 'userDashboard', (route) => false);
      }
    } catch (e) {
      print("Signup failed: $e");
      Fluttertoast.showToast(
        textColor: kWhite,
        gravity: ToastGravity.TOP,
        msg: 'Failed to sign up. Please try again.',
        backgroundColor: kBlack,
      );
    }
  }

   loginUser(String email, String password, BuildContext context) async {
    try {
      // Fetch the admin credentials from Firestore
      DocumentSnapshot adminDoc = await FirebaseFirestore.instance
          .collection('adminCredentials')
          .doc('admin')
          .get();
      String? adminEmail = adminDoc.get('email');
      String? adminPassword = adminDoc.get('password');

      if (email == adminEmail) {
        // Validate the admin password
        if (password == adminPassword) {
          // Navigate to admin dashboard
          Navigator.pushNamedAndRemoveUntil(context, 'adminDashboard',(route) => false);
        } else {
          Fluttertoast.showToast(
            textColor: kWhite,
            gravity: ToastGravity.TOP,
            msg: 'Incorrect Username or password',
            backgroundColor: kBlack,
          );
          throw Exception('Invalid admin credentials.');
        }
      } else {
        // Proceed with regular user login
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        Navigator.pushNamedAndRemoveUntil(context, 'userDashboard',(route) => false);
      }
    } catch (e) {
      print("Login failed: $e");
      Fluttertoast.showToast(
        textColor: kWhite,
        gravity: ToastGravity.TOP,
        msg: 'Incorrect Username or password',
        backgroundColor: kBlack,
      );
    }
  }
}
