import 'package:flutter_apps/models/model_foods.dart';

class DataFoods{
  static var itemFoods = [
    ModelFoods(
      "Ayam Goreng", 
      "images/ayam-goreng.jpg", 
      "https://selerasa.com/resep-dan-cara-membuat-ayam-goreng-renyah-yang-empuk-lezat-dan-enak", 
      "Ayam goreng adalah hidangan yang dibuat dari daging ayam dicampur tepung bumbu yang digoreng dalam minyak goreng panas. Beberapa rumah makan siap saji secara khusus menghidangkan ayam goreng, misalnya Kentucky Fried Chicken. Sementara itu beberapa rumah makan di Indonesia juga menghidangkan ayam goreng tradisional Indonesia seperti Ayam Goreng Suharti, Fatmawati dan Mbok Berek. Makanan ini juga identik dengan karakter Ipin dalam serial TV anak Upin & Ipin"
    ),
    ModelFoods(
      "Bakso",
      "images/bakso.jpg",
      "https://www.dream.co.id/resep/cara-membuat-bakso-180809t.html",
      "test Bakso"
    ),
    ModelFoods(
      "Sate",
      "images/sate-ayam.jpg",
      "http://www.dapurkobe.co.id/sate-ayam",
      "test sate ayam"
    ),
    ModelFoods(
      "Rendang",
      "images/rendang.jpg",
      "https://resepedia.id/resep/cara-membuat-rendang-padang",
      "test rendang"
    )
  ];

  static var itemFoodNums = itemFoods.length;

  static ModelFoods getItemFoods(int index){
    return itemFoods[index];
  }
}