import 'package:youtube_explode_dart/youtube_explode_dart.dart';

/// 커스텀 HttpClient: 요청 헤더에 쿠키를 추가
class CookieYT extends YoutubeHttpClient {
  final String cookie;

  CookieYT(this.cookie);

  @override
  Map<String, String> get headers {
    final h = {
      ...super.headers, // 기본 헤더 유지
      'cookie': cookie, // ✅ 원하는 쿠키 적용
      'user-agent': 'MyApp/1.0 (Custom UA)', // 필요시 UA도 변경 가능
    };
    print("👉 최종 요청 헤더: $h"); // 디버깅용
    return h;
  }
}

void main() async {
  const myCookie = "PREF=...; VISITOR_INFO1_LIVE=...; YSC=...";

  final client = CookieYT(myCookie);
  final yt = YoutubeExplode(client);

  // 👉 여기서 직접 찍으면 헤더 확인 가능
  print(client.headers);

  // 테스트로 영상 요청 (여기서도 headers가 실제로 사용됨)
  final video = await yt.videos.get("dQw4w9WgXcQ");
  print("제목: ${video.title}");

  yt.close();
}
