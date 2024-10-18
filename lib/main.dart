import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task/core/router/router.dart';
import 'package:test_task/core/styles/theme.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task/core/utils/constants/constants.dart';
import 'package:test_task/main.config.dart';
// ignore: depend_on_referenced_packages
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => $initGetIt(getIt);

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: [
        Locale(Constant.translationsConstants.localeAR),
        Locale(Constant.translationsConstants.localeEN),
      ],
      path: 'assets/translations',
      startLocale: Locale(Constant.translationsConstants.localeDefault),
      fallbackLocale: Locale(Constant.translationsConstants.localeDefault),
      useOnlyLangCode: true,
      child: ScreenUtilInit(
        designSize: const Size(375, 760),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,
          title: 'Touring',
          theme: appThemeData,
          onGenerateRoute: onGenerateRoute,
        )
      ),
    );
  }
}
