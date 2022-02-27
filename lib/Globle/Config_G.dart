import 'package:vl_ui/model/CheckSameCustome.dart';
import 'package:vl_ui/model/Information_Cutome.dart';
import 'package:vl_ui/model/Information_Shop.dart';
import 'package:vl_ui/model/New_Changer.dart';

class Config_G{
  static bool ROLE_ADMIN = true;
  static bool ROLE_MODERATOR = true;
  static bool ROLE_USER = true;
  static bool check_lang = false;
  static bool check_namecustom_chossen = false;
  static List<Information_Cutome> NameCustom_shop =[];
  static List<Information_Shop> NameShop=[];
  static List<CheckSameCustome> modelCustome = [];
  static List<Information_Bill> modelBill = [];
  static String url = 'http://103.161.16.61:27554';
  // static String url = 'http://192.168.45.89:27554';
  static String Token_app = "";
  static String Create_Transation = "";
  static String id_Custome_shop = "";
  static String check_done_reshop = "";
  static String check_done_edit_shop = "";
  static String check_done_edit_custome = "";
  static String check_done_edit_custome_shop = "";
  static String Response_Transation_Map_Shop_Custome =  "";
  static String Response_Shop =  "";
  static String Response_Custome =  "";
  static String namecustom_chossen = "";
  static String ColorsBtnOption = "#388118";
  static String Usernames = "";
  static String Tilte_ens = "Hello," + Usernames;
  static String Tilte_vis  = "Xin Chào," + Usernames;
  static String Tilte_eng  = "Hi," + Usernames;
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
}