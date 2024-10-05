library medibound_library;

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


export 'src/schemas.dart';
export 'src/types.dart';
export 'src/data-ui.dart';
export 'src/components.dart';


Future<void> initialize() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}


