abstract class IFirebaseAuthService {
  Future<void> signInWithPhoneNumber(String phoneNumber);
  Future<void> verifyOtpCode({required String otpCode, required String verificationId});
}
