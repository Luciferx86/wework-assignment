enum BottomNavItemType {
  we_movies,
  explore,
  upcoming,
}

extension BottomNavItemTypeExtension on BottomNavItemType {
  String get title {
    switch (this) {
      case BottomNavItemType.we_movies:
        return 'We Movies';
      case BottomNavItemType.explore:
        return 'Explore';
      case BottomNavItemType.upcoming:
        return 'Upcoming';
      default:
        return '';
    }
  }

  String get selectedPath {
    return "assets/images/home/${name}_selected.png";
  }

  String get unSelectedPath {
    return "assets/images/home/$name.png";
  }
}
