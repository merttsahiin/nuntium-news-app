import 'models/user.dart';
import 'models/article.dart';
import '../constants/image_constants.dart';

const String _sampleContent =
    "Leads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races.\n\nFor more detailed state results click on the States A-Z links at the bottom of this page. Results source: NEP/Edison via Reuters.\n\nLeads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races.\n\nFor more detailed state results click on the States A-Z links at the bottom of this page. Results source: NEP/Edison via Reuters.";

User user = User(
  name: "Mert Şahin",
  role: "Engineer",
  email: "merta484@gmail.com",
  photo:
      "https://lh3.googleusercontent.com/a/AAcHTtdVj-7XUxurWVm-DXIb8Wq1PeFBoKjBMN3pB75FTamzpQ=s288-c-no",
);

Article article1 = Article(
  title: "The latest situation in the presidential election",
  content: _sampleContent,
  category: "US Election",
  headerImage: ImageConstants.image1,
  writer: user,
);
Article article2 = Article(
  category: "UI/UX Design",
  title: "A Simple Trick For Creating Color Palettes Quickly",
  headerImage: ImageConstants.image3,
  content: _sampleContent,
  writer: user,
);
Article article3 = Article(
  category: "Art",
  title: "Six steps to creating a color palette",
  headerImage: ImageConstants.image4,
  content: _sampleContent,
  writer: user,
);
Article article4 = Article(
  category: "Colors",
  title: "Creating Color Palette from world around you",
  headerImage: ImageConstants.image5,
  content: _sampleContent,
  writer: user,
);
Article article5 = Article(
  category: "UI/UX Design",
  title: "A Simple Trick For Creating Color Palettes Quickly",
  headerImage: ImageConstants.image6,
  content: _sampleContent,
  writer: user,
);

List<Article> articles = [
  article1,
  article2,
  article3,
  article4,
  article5,
];
