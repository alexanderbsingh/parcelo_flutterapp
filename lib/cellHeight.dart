double cellHeight(String type) {
  switch (type) {
    case "top":
      {
        return 270;
      }
      break;

    case "product":
      {
        return 246;
      }
      break;

    case "store":
      {
        return 246;
      }
      break;

    case "smallProduct":
      {
        return 110;
      }
      break;

    default:
      {
        return 180;
      }
  }

}