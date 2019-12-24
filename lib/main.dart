import 'package:chat_mate/services/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_screen.dart';
import 'services/chat_services.dart';

void main() => runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => ChatService()),
        ChangeNotifierProvider(create: (_) => ThemeChanger())
      ], child: MyApp()),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeChanger>(context, listen: false).fetchThemeType();
    return Consumer<ThemeChanger>(builder: (context, theme, _) {
      if (theme.isDarkMode == null)
        return _loadingWidget();
      else
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
          theme: Provider.of<ThemeChanger>(context).getTheme(),
        );
    });
  }

  Widget _loadingWidget() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          value: null,
          strokeWidth: 3.0,
        ),
      ),
    );
  }
}
