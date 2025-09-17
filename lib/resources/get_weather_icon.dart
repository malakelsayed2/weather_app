class GetWeatherIcon {
  String getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'clear':
        return 'assets/images/clear.png';
      case 'rain':
        return "assets/images/rain.png";
      case 'drizzle':
        return "assets/images/rain.png";
      case 'snow':
        return "assets/images/snowflake.png";
      case 'thunderstorm':
        return "assets/images/thunder.png";
      default:
        return "assets/images/clouds.png";
    }
  }
}
