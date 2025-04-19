import 'package:flutter/material.dart';
import 'package:myapp/UI/_core/app_theme.dart';
import 'package:myapp/UI/_core/bag_provider.dart';
import 'package:myapp/UI/splash/splash_screen.dart';
import 'package:myapp/data/restaurant_data.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RestaurantData restaurantData = RestaurantData();
  await restaurantData.getRestaurants();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context){
            return restaurantData;
          },
        ),
        ChangeNotifierProvider(create: (context) => BagProvider())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme, home: SplashScreen());
  }
}
