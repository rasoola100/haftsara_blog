
import 'dart:async';

import 'package:get/get.dart';
import 'package:haftsara_blog/components/api_url_constant.dart';
import 'package:haftsara_blog/model/podcast_file_model.dart';
import 'package:haftsara_blog/services/dio_service.dart';
import 'package:just_audio/just_audio.dart';

class SinglePodcastController extends GetxController {
  dynamic id;
  SinglePodcastController({this.id});
  RxBool loading = false.obs;
  RxList<PodcastFileModel> podcastFileList = RxList();
  late dynamic playList;
  final player = AudioPlayer();
  RxBool playState = false.obs;
  RxInt currentPodcastIndex = 0.obs;


  @override
  onInit() async{
    super.onInit();

    playList = ConcatenatingAudioSource(
      useLazyPreparation: true,
      children: []
      );
    await getPodcastFiles();
    await player.setAudioSource(playList, initialIndex: 0, initialPosition: Duration.zero);
  }

  getPodcastFiles() async {
    loading.value = true;
    var response = await DioService().getMethod(ApiUrlConstant.getPodcast + id);
    if (response.statusCode == 200) {
      for (var element in response.data['files']) {
        podcastFileList.add(PodcastFileModel.fromJson(element));
        playList.add(AudioSource.uri(Uri.parse(PodcastFileModel.fromJson(element).file!)));
      }
      loading.value = false;
      // log(response.data);
    }
  }



  Rx<Duration> progressValue = const Duration(seconds: 0).obs;
  Rx<Duration> bufferedValue = const Duration(seconds: 0).obs;
  Timer? timer;

  setProgress() {
    const tick = Duration(seconds: 1);
    int duration = player.duration!.inSeconds - player.position.inSeconds;

    if (timer != null) {
      if(timer!.isActive) {
        timer!.cancel();
        timer = null;
      }
    }

    timer = Timer.periodic(tick, (timer) {
      duration --;
      progressValue.value = player.position;
      bufferedValue.value = player.bufferedPosition;
      if (duration <= 0) {
        timer.cancel();
        progressValue.value = const Duration(seconds: 0);
        bufferedValue.value = const Duration(seconds: 0);
      }
    });

  }

  RxBool isLoopAll = false.obs;

  setLoopModeMusicPlayer() {
    if(isLoopAll.value) {
      isLoopAll.value = false;
      player.setLoopMode(LoopMode.off);
    } else {
      isLoopAll.value = true;
      player.setLoopMode(LoopMode.all);
    }
  }

}
