import 'package:chat/core/services/notification/chat_notification_service.dart';
import 'package:chat/screens/auth_or_app_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((_) => ChatNotificationService()),
        )
      ],
      child: MaterialApp(
        title: 'Chat',
        theme: ThemeData(
          colorSchemeSeed: const Color(0xFF165FA0),
          useMaterial3: true,
          fontFamily: 'RobotoFlex',
        ),
        debugShowCheckedModeBanner: false,
        home: const AuthOrAppScreen(),
      ),
    );
  }
}
