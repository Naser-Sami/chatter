import '/features/_features.dart';

abstract class IFirebaseAuthService {
  UserModel userModel = UserModel.empty();

  // Sign in with phone number
  Future<void> signInWithPhoneNumber(String phoneNumber);

  // Verify otp code
  Future<void> verifyOtpCode({
    required String otpCode,
    required String verificationId,
    required Function onSuccess,
  });

  // Check if user exist
  Future<bool> checkIfUserExist();

  // Get user data from the firestore
  Future<UserModel> getUserData();

  // Save user data to the local storage
  void saveUserDataToLocalStorage();

  // Get user data from the local storage
  UserModel getUserDataFromLocalStorage();
}
