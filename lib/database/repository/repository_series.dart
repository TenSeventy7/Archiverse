import 'package:archiverse/database/repository.dart';
import 'package:archiverse/models/series.dart';
import 'package:archiverse/models/work.dart' as work;
import 'package:archiverse/database/dao/dao_series.dart';

extension SeriesRepository on DataRepository {
  static Future<void> saveSeries(Series series) async {
    await DataRepository.database.seriesDao.insertOrUpdate(series);
  }

  static Future<Series?> getSeries(int seriesId) async {
    return await DataRepository.database.seriesDao.getSeriesById(seriesId);
  }

  static Future<List<Series>> searchSeries(
    String query, {
    int limit = 50,
  }) async {
    return await DataRepository.database.seriesDao.searchSeries(
      query,
      limit: limit,
    );
  }

  static Future<List<Series>> getPopularSeries({int limit = 50}) async {
    return await DataRepository.database.seriesDao.getPopularSeries(
      limit: limit,
    );
  }

  static Future<List<Series>> getRecentSeries({int limit = 50}) async {
    return await DataRepository.database.seriesDao.getRecentSeries(
      limit: limit,
    );
  }

  static Future<List<Series>> getCompletedSeries({int limit = 50}) async {
    return await DataRepository.database.seriesDao.getCompletedSeries(
      limit: limit,
    );
  }

  static Future<List<Series>> getOngoingSeries({int limit = 50}) async {
    return await DataRepository.database.seriesDao.getOngoingSeries(
      limit: limit,
    );
  }

  static Future<List<work.SeriesWork>> getWorkSeries(int workId) async {
    return await DataRepository.database.seriesDao.getWorkSeries(workId);
  }

  static Future<List<SeriesWork>> getSeriesWorks(int seriesId) async {
    return await DataRepository.database.seriesDao.getSeriesWorks(seriesId);
  }

  static Future<void> linkWorkToSeries(
    int workId,
    int seriesId,
    int part,
  ) async {
    await DataRepository.database.seriesDao.linkWorkToSeries(
      workId,
      seriesId,
      part,
    );
  }

  static Future<void> unlinkWorkFromSeries(int workId, int seriesId) async {
    await DataRepository.database.seriesDao.unlinkWorkFromSeries(
      workId,
      seriesId,
    );
  }

  static Future<void> updateWorkPartInSeries(
    int workId,
    int seriesId,
    int newPart,
  ) async {
    await DataRepository.database.seriesDao.updateWorkPartInSeries(
      workId,
      seriesId,
      newPart,
    );
  }

  static Future<int?> getWorkPartInSeries(int workId, int seriesId) async {
    return await DataRepository.database.seriesDao.getWorkPartInSeries(
      workId,
      seriesId,
    );
  }

  static Future<int> saveSeriesAndGetId(Series series) async {
    return await DataRepository.database.seriesDao.insertOrUpdateSeriesAndGetId(
      series,
    );
  }

  static Future<void> updateSeriesStats(
    int seriesId, {
    int? words,
    int? works,
    int? bookmarks,
    DateTime? updateDate,
    bool? finished,
  }) async {
    await DataRepository.database.seriesDao.updateSeriesStats(
      seriesId,
      words: words,
      works: works,
      bookmarks: bookmarks,
      updateDate: updateDate,
      finished: finished,
    );
  }

  static Future<void> recalculateSeriesStats(int seriesId) async {
    await DataRepository.database.seriesDao.recalculateSeriesStats(seriesId);
  }

  static Future<void> removeAllWorksFromSeries(int seriesId) async {
    await DataRepository.database.seriesDao.removeAllWorksFromSeries(seriesId);
  }

  static Future<int> getNextPartNumber(int seriesId) async {
    return await DataRepository.database.seriesDao.getNextPartNumber(seriesId);
  }

  static Future<void> reorderSeriesWorks(
    int seriesId,
    List<int> workIdsInOrder,
  ) async {
    await DataRepository.database.seriesDao.reorderSeriesWorks(
      seriesId,
      workIdsInOrder,
    );
  }

  static Future<Map<String, int>> getSeriesStatistics() async {
    return await DataRepository.database.seriesDao.getSeriesStatistics();
  }

  static Future<void> deleteSeries(int seriesId) async {
    await DataRepository.database.seriesDao.deleteWhere(
      (s) => s.id.equals(seriesId),
    );
  }

  static Future<bool> seriesExists(int seriesId) async {
    return await DataRepository.database.seriesDao.seriesExists(seriesId);
  }

  static Future<int> getSeriesCount() async {
    return await DataRepository.database.seriesDao.getSeriesCount();
  }

  static Future<List<Series>> getAllSeries() async {
    final seriesList = await DataRepository.database.seriesDao.getAll();
    return seriesList
        .map((s) => DataRepository.database.seriesDao.fromRow(s))
        .toList();
  }
}
