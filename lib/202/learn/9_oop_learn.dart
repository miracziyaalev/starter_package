// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:starter_package/202/learn/11_custom_exception.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);

  bool? toShare() {
    return null;
  }
}

class FileDownload extends IFileDownload with ShareMixin {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();

    print('a');

    return true;
  }
}

class SMSDownload implements IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();

    print('a');

    return true;
  }

  @override
  bool? toShare() {
    throw UnimplementedError();
  }
}

class FileItem {
  final String? name;
  final File? file;

  FileItem(this.name, this.file);
}

mixin ShareMixin on IFileDownload {
  void toShowFile() {}
}

//implements edilirse abstract classtan ozellikler alinir ve kendisine gore uyarlanir. disardan guc kazandiramazsin
// extends edilirse abstract classtan ozellikler alinir ve degistirilmeden kullanir. ustune mixin eklenerek guc kazandirabilirsin