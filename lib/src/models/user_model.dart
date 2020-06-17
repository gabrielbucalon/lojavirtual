import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model{

  // Usuario atual

  bool isLoading = false;

  void signUp(){

  }

  void signIn() async{
    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));

    isLoading = false;
    notifyListeners();
  }

  void recoverPassword(){
    
  }

  void isLoggedIn(){
    
  }
}