import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kabor/features/menu/settings/presentation/edit_profile/repository/edit_profile_repository_impl.dart';
import 'package:http_parser/http_parser.dart';
import '../provider/edit_profile_state.dart';
import 'package:mime/mime.dart';


class EditProfileRepositoryImpl extends EditProfileRepository{
  final Ref ref;
  EditProfileRepositoryImpl(this.ref);

  @override
  Future<UserModel> editProfile(String fName, String lName, String email, File image) async {
    try {
      final reqData = {
        'fname': fName,
        'lname': lName,
        'email': email,
      };

      final formData = FormData.fromMap(reqData);
      var entries = <MapEntry<String, MultipartFile>>[];

      for (File file in image) {
        final fileName = file.path.split('/').last;

        final path = file.path;
        final mimeType =
            lookupMimeType(path, headerBytes: [0xFF, 0xD8])!.split('/');
        entries.add(
          MapEntry(
            'image',
            MultipartFile.fromFileSync(path,
                filename: fileName,
                contentType: MediaType(mimeType[0], mimeType[1])),
          ),
        );
      

      formData.files.addAll(entries);
      
    } on DioError catch (e) {
      return AppException.handleError(e);
    }
  }
}


final editProfileRepository = Provider<EditProfileRepository>(
    (_) => EditProfileRepositoryImpl(_));

