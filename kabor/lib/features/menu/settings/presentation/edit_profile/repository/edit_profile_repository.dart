// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:kabor/features/menu/settings/presentation/edit_profile/repository/edit_profile_repository_impl.dart';
// import 'package:http_parser/http_parser.dart';
// import '../../../../../../core/configs/app_constants.dart';
// import '../provider/edit_profile_state.dart';
// import 'package:mime/mime.dart';


// class EditProfileRepositoryImpl extends EditProfileRepository{
//   final Ref _ref;
//   EditProfileRepositoryImpl(this.ref);

//   @override
//   Future<UserModel> editProfile(String fName, String lName, String email, File image) async {
//  try {
//       final dioObj = _ref.read(dioProvider);
//       final formData = dio.FormData.fromMap(UserModel.toJson());
//       final fileName = image.path.split('/').last;
//       final mimeTypeData =
//           lookupMimeType(image.path, headerBytes: [0xFF, 0xD8])!.split('/');

//       dio.MultipartFile imageFile = await dio.MultipartFile.fromFile(
//         image.path,
//         filename: fileName,
//         contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
//       );
//       final fileExtension = p.extension(image.path);
//       final reqExtension = fileExtension.split('.');
//       // dio.options.headers = {
//       //   'Content-Type': 'image/${extension.last}',
//       // };
//       formData.fields
//           .add(MapEntry('Content-Type', 'image/${reqExtension.last}'));
//       formData.files.add(
//         MapEntry(
//           'image',
//           imageFile,
//         ),
//       );

//       final response = await dioObj.post(
//         url,
//         data: formData,
//       );

//       if (response.statusCode == HttpStatus.ok ||
//           response.statusCode == HttpStatus.noContent) {
//         final result = await profileAvatar(
//           imageExtension: reqExtension.last,
//           imagePath: signedRequestModel.key!.split('.')[0],
//           userType: 0,
//         );
//         return result;
//       } else {
//         throw SettingsException(
//           AppConstants.unknownErrorMessage,
//         );
//       }
//     } on SocketException {
//       throw SettingsException(
//         'No internet connection, Pls connect to the internet and try again.',
//       );
//     } on dio.DioError catch (e) {
//       if (e.response != null) {
//         print(e.response!.statusCode);
//         print(e.response!.data);
//         throw SettingsException(AppConstants.unknownErrorMessage);
//       }
//       throw SettingsException(
//         AppConstants.unknownErrorMessage,
//       );
//     }
// }
// }


// final editProfileRepository = Provider<EditProfileRepository>(
//     (_) => EditProfileRepositoryImpl(_));

