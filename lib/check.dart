class SystemCheck{
  bool isMobile(width){
    // if(kIsWeb && (Theme.of(context).platform.toString() == "TargetPlatform.android" || Theme.of(context).platform.toString() == "TargetPlatform.iOS")){
    //   return true;
    // }else{
    //   return false;
    return width > 600 ? false : true;
  }
}