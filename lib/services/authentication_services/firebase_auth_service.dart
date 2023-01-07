import 'package:candly/widgets/accessoryWidgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  //for giving verid to otp_verification_screen for otp verification
  static String verificationId = "";
  static int? _resendToken;

  static Future<void> requestOtp(String phoneNo, BuildContext context) async {
    final auth = FirebaseAuth.instance;
    try {
      //send otp
      await auth.verifyPhoneNumber(
          phoneNumber: "+91$phoneNo",
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException exception) {
            if (exception.code == 'invalid-phone-number') {
              AccessoryWidgets.snackBar(context, "Invalid phone number");
            } else if (exception.message != null) {
              AccessoryWidgets.snackBar(context, exception.message as String);
            }
          },
          codeSent: (verId, resendToken) {
            verificationId = verId;
            _resendToken = resendToken;
          },
          codeAutoRetrievalTimeout: (String verificationId) {});
    } on FirebaseAuthException catch (error) {
      AccessoryWidgets.snackBar(context, error.toString());
    } catch (error) {
      print(error.toString());
    }
  }
//for resending OTP
  static Future<void> resendOtp(String phoneNo, BuildContext context) async {
    final auth = FirebaseAuth.instance;
    try {
      //send otp
      await auth.verifyPhoneNumber(
          phoneNumber: "+91$phoneNo",
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException exception) {
            if (exception.code == 'invalid-phone-number') {
              AccessoryWidgets.snackBar(context, "Invalid phone number");
            } else if (exception.message != null) {
              AccessoryWidgets.snackBar(context, exception.message as String);
            }
          },
          forceResendingToken: _resendToken,
          codeSent: (verId, resendToken) {
            verificationId = verId;
          },
          codeAutoRetrievalTimeout: (String verificationId) {});
    } on FirebaseAuthException catch (error) {
      AccessoryWidgets.snackBar(context, error.toString());
    } catch (error) {
      print(error.toString());
    }
  }
}
