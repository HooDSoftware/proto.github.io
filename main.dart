// import 'package:hood/authentication/car_info_screen.dart';
// import 'package:hood/onBoarding/onboarding.dart';
// import 'package:hood/splashScreen/splash_screen.dart';
// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers

import 'package:firebase_core/firebase_core.dart';
//import 'authentication/login_screen.dart';
//import 'chatBubble/chat.dart';
import 'package:fade_shimmer/fade_shimmer.dart';

import 'firebase_options.dart';
//import 'screens/signup_screen.dart';
// import 'package:hood/authentication/car_info_screen.dart';
// import 'loader/skeleton_loader.dart';
// import 'onBoarding/onboarding.dart';
// import 'package:loading_skeleton/loading_skeleton.dart';
//import 'package:proton/mainScreens/main_screen.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:proton/providers/user_provider.dart';
import 'package:proton/responsive/mobile_screen_layout.dart';
import 'package:proton/responsive/responsive_layout.dart';
import 'package:proton/responsive/web_screen_layout.dart';
import 'package:proton/screens/login_screen.dart';
import 'package:proton/utils/colors.dart';
import 'package:provider/provider.dart';
//import 'services/auth_service.dart';

//import 'package:proton/tabPages/earning_tab.dart';
//import 'package:shimmer/shimmer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await AuthService().getOrCreateUser();
  runApp(const MyApp(
    
  ));
}
  
  
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Prototype',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        // routes: {
        //   'loading': (_) => LoadingListPage(),
        // },
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              // Checking if the snapshot has any data or not
              if (snapshot.hasData) {
                // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
                return const ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }

            // means connection to future hasnt been made yet
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: LoadingPage(),
              );
            }

            return const LoginScreen();
          },
        ),
      ),
    );
  }
}

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xff181818) : const Color(0xffF0F2F5),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.wb_sunny,
          color: Colors.white.withOpacity(isDarkMode ? 0.5 : 1),
        ),
        onPressed: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
      ),
      body: Container(
        child: ListView.separated(
          itemBuilder: (_, i) {
            final delay = (i * 300);
            return Container(
              decoration: BoxDecoration(
                  color: isDarkMode ? const Color(0xff242424) : Colors.white,
                  borderRadius: BorderRadius.circular(8)),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  FadeShimmer.round(
                    size: 60,
                    fadeTheme: isDarkMode ? FadeTheme.dark : FadeTheme.light,
                    millisecondsDelay: delay,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeShimmer(
                        height: 8,
                        width: 150,
                        radius: 4,
                        millisecondsDelay: delay,
                        fadeTheme:
                            isDarkMode ? FadeTheme.dark : FadeTheme.light,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      FadeShimmer(
                        height: 8,
                        millisecondsDelay: delay,
                        width: 170,
                        radius: 4,
                        fadeTheme:
                            isDarkMode ? FadeTheme.dark : FadeTheme.light,
                      ),
                    ],
                  )
                ],
              ),
            );
          },
          itemCount: 20,
          separatorBuilder: (_, __) => const SizedBox(
            height: 16,
          ),
        ),
      ),
    );
  }
}
