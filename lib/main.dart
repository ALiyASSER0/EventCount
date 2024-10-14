import 'package:event_count_downar/constants/colors.dart';
import 'package:event_count_downar/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:event_count_downar/cubits/notes_cubit/notes_cubit.dart';
import 'package:event_count_downar/helpers/shared.dart';
import 'package:event_count_downar/models/note_model.dart';
import 'package:event_count_downar/routing/app_router.dart';
import 'package:event_count_downar/routing/routes.dart';
import 'package:event_count_downar/sample_bloc_observable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sizer/sizer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Shared.init();
  await Hive.initFlutter();
  Bloc.observer = SampleBlocObservable();
    Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNoteBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
              initialRoute: Routes.onboarding,
            );
          },
        ),
      ),
    );
  }
}
