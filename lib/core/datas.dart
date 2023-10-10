import 'package:nuntium_news_app/constants/image_constants.dart';
import 'package:nuntium_news_app/core/models/article.dart';
import 'package:nuntium_news_app/core/models/user.dart';

const _sampleContent =
    "Leads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races.\n\nFor more detailed state results click on the States A-Z links at the bottom of this page. Results source: NEP/Edison via Reuters.\n\nLeads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races.\n\nFor more detailed state results click on the States A-Z links at the bottom of this page. Results source: NEP/Edison via Reuters.";

final user = User(
  name: "Mert Şahin",
  role: "Engineer",
  email: "merta484@gmail.com",
  photo:
      "https://lh3.googleusercontent.com/a/AAcHTtdVj-7XUxurWVm-DXIb8Wq1PeFBoKjBMN3pB75FTamzpQ=s288-c-no",
);

final article1 = Article(
  title: "The latest situation in the presidential election",
  content: _sampleContent,
  category: "US Election",
  headerImage: ImageConstants.image1,
  writer: user,
);
final article2 = Article(
  category: "UI/UX Design",
  title: "A Simple Trick For Creating Color Palettes Quickly",
  headerImage: ImageConstants.image3,
  content: _sampleContent,
  writer: user,
);
final article3 = Article(
  category: "Art",
  title: "Six steps to creating a color palette",
  headerImage: ImageConstants.image4,
  content: _sampleContent,
  writer: user,
);
final article4 = Article(
  category: "Colors",
  title: "Creating Color Palette from world around you",
  headerImage: ImageConstants.image5,
  content: _sampleContent,
  writer: user,
);
final article5 = Article(
  category: "UI/UX Design",
  title: "A Simple Trick For Creating Color Palettes Quickly",
  headerImage: ImageConstants.image6,
  content: _sampleContent,
  writer: user,
);

final articles = <Article>[
  article1,
  article2,
  article3,
  article4,
  article5,
];
