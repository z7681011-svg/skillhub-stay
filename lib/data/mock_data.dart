import '../models/booking_model.dart';
import '../models/skill_model.dart';
import '../models/stay_model.dart';
import '../models/user_model.dart';

class MockData {
  const MockData._();

  static const List<SkillModel> skills = [
    SkillModel(id: 'photography', title: 'Photography'),
    SkillModel(id: 'cooking', title: 'Cooking'),
    SkillModel(id: 'art', title: 'Art'),
    SkillModel(id: 'local-tour', title: 'Local Tour'),
    SkillModel(id: 'gardening', title: 'Gardening'),
  ];

  static const List<StayModel> stays = [
    StayModel(
      id: 's1',
      title: "Sarah's Creative Stay",
      hostName: 'Sarah Ahmed',
      location: 'Sydney, NSW',
      pricePerNight: 48,
      rating: 4.8,
      skillName: 'Photography',
      description:
          'A bright private room with a weekend photo walk hosted by Sarah.',
    ),
    StayModel(
      id: 's2',
      title: 'Marina Food Stay',
      hostName: 'Marina Khan',
      location: 'Melbourne, VIC',
      pricePerNight: 55,
      rating: 4.7,
      skillName: 'Cooking',
      description:
          'A cozy stay near the coast with a hands-on local cooking session.',
    ),
    StayModel(
      id: 's3',
      title: 'Artisan Loft',
      hostName: 'Bilal Noor',
      location: 'Brisbane, QLD',
      pricePerNight: 42,
      rating: 4.6,
      skillName: 'Art',
      description:
          'A compact loft above a small studio, ideal for learning sketching basics.',
    ),
    StayModel(
      id: 's4',
      title: 'Coastal Skill Retreat',
      hostName: 'Ayesha Malik',
      location: 'Gold Coast, QLD',
      pricePerNight: 72,
      rating: 4.9,
      skillName: 'Local Tour',
      description:
          'A relaxed retreat with guided neighborhood walks and local stories.',
    ),
  ];

  static const List<BookingModel> bookings = [
    BookingModel(
      bookingId: 'SHS-1024',
      stayTitle: "Sarah's Creative Stay",
      selectedOption: '2 nights with photography session',
      dateText: '20 May 2026',
      totalPrice: 96,
    ),
  ];

  static const UserModel user = UserModel(
    name: 'Student User',
    email: 'student@example.com',
    phone: '+61 400 123 456',
    avatarInitials: 'SU',
  );
}
