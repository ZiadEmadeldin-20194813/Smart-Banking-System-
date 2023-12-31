import 'package:face_net_authentication/FaceServices/camera.service.dart';
import 'package:face_net_authentication/FaceServices/ml_service.dart';
import 'package:face_net_authentication/FaceServices/face_detector_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupServices() {
  locator.registerLazySingleton<CameraService>(() => CameraService());
  locator.registerLazySingleton<FaceDetectorService>(() => FaceDetectorService());
  locator.registerLazySingleton<MLService>(() => MLService());
}
