import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'utils/theme.dart';
import 'providers/auth_provider.dart';
import 'providers/service_provider.dart';
import 'screens/service_list_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ServiceProvider()),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Multi-Service App',
            theme: appTheme,
            home: authProvider.isLoggedIn
                ? HomeScreen(isLoggedIn: true)
                : LoginScreen(),
            routes: {
              '/login': (context) => LoginScreen(),
              '/register': (context) => RegistrationScreen(),
              '/home': (context) => HomeScreen(isLoggedIn: true),
              '/categories': (context) => ServiceListScreen(
                    isLoggedIn: true,
                  ),
            },
          );
        },
      ),
    );
  }
}
