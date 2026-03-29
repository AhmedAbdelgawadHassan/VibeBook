import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

Future<void> downloadBook(String url, String fileName) async {
  try {
    var status = await Permission.storage.request();

    if (!status.isGranted) {
      print('Permission denied');
      return;
    }

    // 📂 مكان الحفظ
    Directory dir = await getApplicationDocumentsDirectory();

    String filePath = "${dir.path}/$fileName.pdf";

    // ⬇️ تحميل
    await Dio().download(url, filePath);

    print("Downloaded to $filePath");
  } catch (e) {
    print("Error: $e");
  }
}