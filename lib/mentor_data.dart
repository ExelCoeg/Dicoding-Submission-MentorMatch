class MentorData{
  String name;
  String job;
  String company;
  double rating;
  String mentoringPrice;
  String about;
  String imageAsset;
  List<String> skills;
  MentorData({
    required this.name,
    required this.job,
    required this.company,
    required this.rating,
    required this.mentoringPrice,
    required this.about,
    required this.imageAsset,
    required this.skills,
});
}
final List<MentorData> dummyMentors = [
  MentorData(
    name: "Avery Thompson",
    job: "Lead UX Designer",
    company: "Google",
    rating: 4.9,
    mentoringPrice: "350-730 \$ per month",
    about: "Passionate about creating intuitive user experiences. 8+ years of experience in design systems and product design.",
    imageAsset: "images/avery.jpeg",
    skills: ["Prototyping", "Design Systems", "User Research"],
  ),
  MentorData(
    name: "Morgan Lee",
    job: "Product Designer",
    company: "Apple",
    rating: 4.8,
    mentoringPrice: "400-800 \$",
    about: "Specialized in mobile app design and interaction design. Former design lead at multiple startups.",
    imageAsset: "images/morgan.jpeg",
    skills: ["Prototyping", "Design Systems", "iOS Design"],
  ),
  MentorData(
    name: "Bhupesh Sharma",
    job: "Head of Design",
    company: "Amazon",
    rating: 4.7,
    mentoringPrice: "359-730 \$",
    about: "15+ years of experience in e-commerce design. Expert in scaling design teams and processes.",
    imageAsset: "images/bhupesh.jpeg",
    skills: ["Prototyping", "Design Systems", "Leadership"],
  ),
  MentorData(
    name: "Taylor Brooks",
    job: "Creative Director",
    company: "Adobe",
    rating: 4.9,
    mentoringPrice: "370-680 \$",
    about: "Creative director specializing in brand identity and design systems. Adobe certified expert.",
    imageAsset: "images/taylor.jpg",
    skills: ["Prototyping", "Design Systems", "Brand Design"],
  ),
  MentorData(
    name: "Jordan Smith",
    job: "Head of UX/UI",
    company: "Microsoft",
    rating: 4.8,
    mentoringPrice: "360-730 \$",
    about: "Focused on accessible design and enterprise software. Speaker at major design conferences.",
    imageAsset: "images/jordan.jpg",
    skills: ["Prototyping", "Design Systems", "Accessibility"],
  ),MentorData(
    name: "Jordan Smith",
    job: "Head of UX/UI",
    company: "Microsoft",
    rating: 4.8,
    mentoringPrice: "360-730 \$",
    about: "Focused on accessible design and enterprise software. Speaker at major design conferences.",
    imageAsset: "images/jordan.jpg",
    skills: ["Prototyping", "Design Systems", "Accessibility"],
  ),MentorData(
    name: "Jordan Smith",
    job: "Head of UX/UI",
    company: "Microsoft",
    rating: 4.8,
    mentoringPrice: "360-730 \$",
    about: "Focused on accessible design and enterprise software. Speaker at major design conferences.",
    imageAsset: "images/jordan.jpg",
    skills: ["Prototyping", "Design Systems", "Accessibility"],
  ),
];
