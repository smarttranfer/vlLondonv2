import 'package:vl_ui/model/CheckSameCustome.dart';
import 'package:vl_ui/model/Information_Cutome.dart';
import 'package:vl_ui/model/Information_Shop.dart';
import 'package:vl_ui/model/New_Changer.dart';

class Config_G{
  static List<Information_Cutome> NameCustom =[];
  static List<Information_Shop> NameShop=[];
  static List<CheckSameCustome> modelCustome = [];
  static List<Information_Bill> modelBill = [];
  static String ColorsBtnOption = "#388118";
  static String Usernames = "";
  static String Tilte_ens = "Hello," + Usernames;
  static String Tilte_vis  = "Xin Chào," + Usernames;
  static String createbtn_en = "Create transaction";
  static String createbtn_vi = "Tạo GD";
  static String Login_en = "Hello,Admin";
  static String Login_vi = "Xin Chào,Admin";
  static String title_SignupCustom_vi = "Đăng ký tài khoản";
  static String title_SignupCustom_en = "Sign Up Custome";
  static String title_SignupShop_vi = "Đăng ký shop";
  static String title_SignupShop_en= "Sign Up shop";
  static int  timeDruation = 300;
  static bool checknull(){
    if(modelBill.isEmpty){
      return true;
    }else{
      return false;
    }
  }
  static double moneys(){
    double start = 0;
    for(Information_Bill i in modelBill){
      if(i.money.isEmpty){
        return 0;
      }else{
        start+=double.parse(i.money) ;
      }
    }
    return start;
  }
}