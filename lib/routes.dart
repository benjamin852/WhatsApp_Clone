import 'package:flutter/material.dart';

import 'package:flash_chat/screens/login_screen.dart';

Map<String, WidgetBuilder> getRoutes(context) {
  return {
    LoginScreen.routeName: (BuildContext context) => LoginScreen(),
  };
}
