// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor_driver/core/core.dart';
import 'package:kabor_driver/l10n/l10n.dart';

class KaborApp extends ConsumerStatefulWidget {
  const KaborApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _KaborAppState();
}

class _KaborAppState extends ConsumerState<KaborApp> {
  late final AppRouter appRouter;
  @override
  void initState() {
    super.initState();
    appRouter = AppRouter(ref: ref);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.wait([
        precachePicture(
          ExactAssetPicture(
            SvgPicture.svgStringDecoderBuilder,
            AppImages.welcome,
          ),
          context,
        ),
        precachePicture(
          ExactAssetPicture(
            SvgPicture.svgStringDecoderBuilder,
            AppImages.onboarding,
          ),
          context,
        ),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: (event) {
        final focusScope = FocusScope.of(context);
        if (!focusScope.hasPrimaryFocus && focusScope.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MaterialApp.router(
        routerConfig: appRouter.router,
        debugShowCheckedModeBanner: false,
        theme: AppTheme().currentTheme(ThemeMode.light),
        darkTheme: AppTheme().currentTheme(ThemeMode.dark),
        themeMode: ThemeMode.light,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        // home: const LandingPage(),
      ),
    );
  }
}
