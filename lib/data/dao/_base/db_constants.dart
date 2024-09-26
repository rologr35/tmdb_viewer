class DBConstants {
  static const String dbName = 'tmdb_viewer_db';
  static const int dbVersion = 1;

  ///Common table schema
  static final Map<String, String> tableCols = {
    DBConstants.idKey: DBConstants.textType,
    DBConstants.dataKey: DBConstants.textType,
    DBConstants.localeKey: DBConstants.textType
  };

  ///columns names
  static const String idKey = 'id';
  static const String dataKey = 'data';
  static const String localeKey = 'locale';

  ///columns types
  static const String textType = 'TEXT';
  static const String realType = 'REAL';
  static const String intType = 'INTEGER';

  ///table names
  static const String myListTable = 'my_list_table';
  static const String genresTable = "genres_table";

}
