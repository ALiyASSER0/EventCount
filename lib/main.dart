import 'package:event_count_downar/constants/colors.dart';
import 'package:event_count_downar/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:event_count_downar/cubits/notes_cubit/notes_cubit.dart';
import 'package:event_count_downar/helpers/shared.dart';
import 'package:event_count_downar/models/note_model.dart';

import 'package:event_count_downar/sample_bloc_observable.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sizer/sizer.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'Routes/app_router.dart';
import 'Routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Shared.init();
  await Hive.initFlutter();
  Bloc.observer = SampleBlocObservable();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNoteBox);

  // Initialize Awesome Notifications
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        importance: NotificationImportance.High, 
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.white,
      ),
    ],
    debug: true,
  );

  // Check and request notification permission
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });

  runApp(const BetterFeedback( child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

    // Initialize notification listeners for handling events


    // Request notification permission
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
          BlocProvider(
          create: (context) => AddNoteCubit(),
        )
      ],
      child: BlocProvider(
        create: (context)=>NotesCubit(),
        child: Sizer(
          builder: (BuildContext, Orientation, ScreenType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(fontFamily: "Poppins"),
              onGenerateRoute: onGenerateRoute,
              initialRoute: Routes.splash,
            );
          },
        ),
      ),
    );
  }
}
