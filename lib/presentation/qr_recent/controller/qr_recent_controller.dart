import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myqrcode/core/model/recent_model.dart';
import 'package:myqrcode/service/dependency_service.dart';

class QrRecentController extends GetxController {
  @override
  void onInit() async {
    await getRecentData();
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent == scrollController.offset) {
        print('oke');
        hasMore.isFalse ? null : await getRecentData();
      }
    });
    super.onInit();
  }

  final isLoading = false.obs;

  final page = 1.obs;
  final hasMore = true.obs;
  final data = <RecentModel?>[].obs;
  final dep = Get.find<DependencyService>();
  final scrollController = ScrollController();

  Future onRefresh() async {
    data.clear();
    page.value = 1;
    hasMore.value = false;
    await getRecentData();
  }

  Future getRecentData() async {
    isLoading.value = true;
    final result = await dep.db.getRecent(page.value);
    isLoading.value = false;
    hasMore.value = result.length < 10 ? false : true;
    hasMore.isTrue ? page.value++ : null;
    data.addAll(result);
  }

  Future deleteRecent(int id) async {
    isLoading.value = true;
    final result = await dep.db.deleteRecent(id);
    isLoading.value = false;
    result == true ? data.removeWhere((e) => e!.id == id) : null;
  }

  Future deleteAllRecent() async {
    isLoading.value = true;
    final result = await dep.db.deleteAllRecent();
    isLoading.value = false;
    result == true ? data.clear() : null;
  }
}
