import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_explorer/app.dart';
import 'package:profile_explorer/features/profile_explorer/bloc/profile_bloc.dart';
import 'package:profile_explorer/features/profile_explorer/data/user_service.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ProfileBloc(UserService())..add(FetchProfile()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return App();
  }
}
