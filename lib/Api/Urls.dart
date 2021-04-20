class Url {
  // Api網址
  static String baseUrl = 'https://jxjasper.com/JasperFitness';

// 取回預覽圖
  static String get bannerUrl => '$baseUrl/Banner/Preview';

// 取回最新消息
  static String get newsUrl => '$baseUrl/JasperNews/Index';

// 教練資訊
  static String get coachUrl => '$baseUrl/JasperCoach/query';

// 登入123
  static String get loginUrl => 'http://sp7.allec.com.tw/apisk/login2';
}
