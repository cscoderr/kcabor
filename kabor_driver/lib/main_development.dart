// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor_driver/app/app.dart';
import 'package:kabor_driver/bootstrap.dart';

void main() {
  bootstrap(
    () => const ProviderScope(
      child: KaborApp(),
    ),
  );
}
