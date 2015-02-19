EXPORT VIRTUAL qt_analysis_plugin := RECORD
  UNSIGNED5 plugin_id;
  STRING2000 plugin_name;
  STRING2000 description;
  STRING50 version_cd;
  STRING parameter_info;
  STRING parameter_info_xsd;
  STRING command_line;
  STRING working_folder;
  STRING commandoption_cd;
  STRING plugin_icon;
  STRING50 status_cd;
  STRING50 user_id;
  STRING50 group_id;
  STRING25 create_date;
  STRING25 update_date;
END;
