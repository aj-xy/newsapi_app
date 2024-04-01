// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

News newsFromJson(String str) => News.fromJson(json.decode(str));

String newsToJson(News data) => json.encode(data.toJson());

class News {
    String? status;
    int totalResults;
    List<Result> results;
    String nextPage;

    News({
        required this.status,
        required this.totalResults,
        required this.results,
        required this.nextPage,
    });

    factory News.fromJson(Map<String, dynamic> json) => News(
        status: json["status"],
        totalResults: json["totalResults"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        nextPage: json["nextPage"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "nextPage": nextPage,
    };
}

class Result {
    String articleId;
    String title;
    String link;
    List<String>? keywords;
    List<String>? creator;
    dynamic videoUrl;
    String? description;
    Content content;
    DateTime pubDate;
    String? imageUrl;
    String? sourceId;
    String? sourceUrl;
    String? sourceIcon;
    int sourcePriority;
    List<String> country;
    List<String> category;
    Language language;
    AiTag aiTag;
    AiTag sentiment;
    AiTag sentimentStats;
    AiRegion aiRegion;

    Result({
        required this.articleId,
        required this.title,
        required this.link,
        required this.keywords,
        required this.creator,
        required this.videoUrl,
        required this.description,
        required this.content,
        required this.pubDate,
        required this.imageUrl,
        required this.sourceId,
        required this.sourceUrl,
        required this.sourceIcon,
        required this.sourcePriority,
        required this.country,
        required this.category,
        required this.language,
        required this.aiTag,
        required this.sentiment,
        required this.sentimentStats,
        required this.aiRegion,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        articleId: json["article_id"],
        title: json["title"],
        link: json["link"],
        keywords: json["keywords"] == null ? [] : List<String>.from(json["keywords"]!.map((x) => x)),
        creator: json["creator"] == null ? [] : List<String>.from(json["creator"]!.map((x) => x)),
        videoUrl: json["video_url"],
        description: json["description"],
        content: contentValues.map[json["content"]]!,
        pubDate: DateTime.parse(json["pubDate"]),
        imageUrl: json["image_url"],
        sourceId: json["source_id"],
        sourceUrl: json["source_url"],
        sourceIcon: json["source_icon"],
        sourcePriority: json["source_priority"],
        country: List<String>.from(json["country"].map((x) => x)),
        category: List<String>.from(json["category"].map((x) => x)),
        language: languageValues.map[json["language"]]!,
        aiTag: aiTagValues.map[json["ai_tag"]]!,
        sentiment: aiTagValues.map[json["sentiment"]]!,
        sentimentStats: aiTagValues.map[json["sentiment_stats"]]!,
        aiRegion: aiRegionValues.map[json["ai_region"]]!,
    );

    Map<String, dynamic> toJson() => {
        "article_id": articleId,
        "title": title,
        "link": link,
        "keywords": keywords == null ? [] : List<dynamic>.from(keywords!.map((x) => x)),
        "creator": creator == null ? [] : List<dynamic>.from(creator!.map((x) => x)),
        "video_url": videoUrl,
        "description": description,
        "content": contentValues.reverse[content],
        "pubDate": pubDate.toIso8601String(),
        "image_url": imageUrl,
        "source_id": sourceId,
        "source_url": sourceUrl,
        "source_icon": sourceIcon,
        "source_priority": sourcePriority,
        "country": List<dynamic>.from(country.map((x) => x)),
        "category": List<dynamic>.from(category.map((x) => x)),
        "language": languageValues.reverse[language],
        "ai_tag": aiTagValues.reverse[aiTag],
        "sentiment": aiTagValues.reverse[sentiment],
        "sentiment_stats": aiTagValues.reverse[sentimentStats],
        "ai_region": aiRegionValues.reverse[aiRegion],
    };
}

enum AiRegion {
    ONLY_AVAILABLE_IN_CORPORATE_PLANS
}

final aiRegionValues = EnumValues({
    "ONLY AVAILABLE IN CORPORATE PLANS": AiRegion.ONLY_AVAILABLE_IN_CORPORATE_PLANS
});

enum AiTag {
    ONLY_AVAILABLE_IN_PROFESSIONAL_AND_CORPORATE_PLANS
}

final aiTagValues = EnumValues({
    "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS": AiTag.ONLY_AVAILABLE_IN_PROFESSIONAL_AND_CORPORATE_PLANS
});

enum Content {
    ONLY_AVAILABLE_IN_PAID_PLANS
}

final contentValues = EnumValues({
    "ONLY AVAILABLE IN PAID PLANS": Content.ONLY_AVAILABLE_IN_PAID_PLANS
});

enum Language {
    ENGLISH
}

final languageValues = EnumValues({
    "english": Language.ENGLISH
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
