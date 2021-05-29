///This class is used to Load Package Or Errand Data
abstract class LoadPackageOrErrandData {
  ///This function is used to load package or errand data when the doc id is given
  Future loadPackageOrErrandDataWhenIdIsGiven(String docId, int type);
}
