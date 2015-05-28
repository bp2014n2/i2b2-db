IMPORT STD;
OUTPUT(DATASET([],{INTEGER5 encounter_num, INTEGER5 patient_num, STRING50 concept_cd, STRING50 provider_id, STRING25 start_date, STRING100 modifier_cd, INTEGER5 instance_num, STRING50 valtype_cd, STRING255 tval_char, DECIMAL18_5 nval_num, STRING50 valueflag_cd, DECIMAL18_5 quantity_num, STRING50 units_cd, STRING25 end_date, STRING50 location_cd, STRING observation_blob, DECIMAL18_5 confidence_num, STRING25 update_date, STRING25 download_date, STRING25 import_date, STRING50 sourcesystem_cd, INTEGER5 upload_id, INTEGER5 text_search_index, INTEGER5 archive_upload_id}),,'~i2b2demodata::archive_observation_fact_1432735599656',OVERWRITE);
SEQUENTIAL(Std.File.CreateSuperFile('~i2b2demodata::archive_observation_fact'),
Std.File.StartSuperFileTransaction(),
Std.File.AddSuperFile('~i2b2demodata::archive_observation_fact','~i2b2demodata::archive_observation_fact_1432735599656'),
Std.File.FinishSuperFileTransaction());
OUTPUT(DATASET([],{INTEGER5 upload_id, STRING500 upload_label, STRING100 user_id, STRING50 source_cd, INTEGER8 no_of_record, INTEGER8 loaded_record, INTEGER8 deleted_record, STRING25 load_date, STRING25 end_date, STRING100 load_status, STRING message, STRING input_file_name, STRING log_file_name, STRING500 transform_name}),,'~i2b2demodata::upload_status_1432736029921',OVERWRITE);
SEQUENTIAL(Std.File.CreateSuperFile('~i2b2demodata::upload_status'),
Std.File.StartSuperFileTransaction(),
Std.File.AddSuperFile('~i2b2demodata::upload_status','~i2b2demodata::upload_status_1432736029921'),
Std.File.FinishSuperFileTransaction());
OUTPUT(DATASET([],{STRING50 source_cd, STRING300 description, STRING25 create_date}),,'~i2b2demodata::source_master_1432736016529',OVERWRITE);
SEQUENTIAL(Std.File.CreateSuperFile('~i2b2demodata::source_master'),
Std.File.StartSuperFileTransaction(),
Std.File.AddSuperFile('~i2b2demodata::source_master','~i2b2demodata::source_master_1432736016529'),
Std.File.FinishSuperFileTransaction());
OUTPUT(DATASET([],{INTEGER5 upload_id, INTEGER5 set_type_id, STRING50 source_cd, INTEGER8 no_of_record, INTEGER8 loaded_record, INTEGER8 deleted_record, STRING25 load_date, STRING25 end_date, STRING100 load_status, STRING message, STRING input_file_name, STRING log_file_name, STRING500 transform_name}),,'~i2b2demodata::set_upload_status_1432736009277',OVERWRITE);
SEQUENTIAL(Std.File.CreateSuperFile('~i2b2demodata::set_upload_status'),
Std.File.StartSuperFileTransaction(),
Std.File.AddSuperFile('~i2b2demodata::set_upload_status','~i2b2demodata::set_upload_status_1432736009277'),
Std.File.FinishSuperFileTransaction());
OUTPUT(DATASET([],{INTEGER5 xml_result_id, INTEGER5 result_instance_id, STRING xml_value}),,'~i2b2demodata::qt_xml_result_1432735983520',OVERWRITE);
SEQUENTIAL(Std.File.CreateSuperFile('~i2b2demodata::qt_xml_result'),
Std.File.StartSuperFileTransaction(),
Std.File.AddSuperFile('~i2b2demodata::qt_xml_result','~i2b2demodata::qt_xml_result_1432735983520'),
Std.File.FinishSuperFileTransaction());
OUTPUT(DATASET([],{INTEGER5 result_instance_id, INTEGER5 query_instance_id, INTEGER5 result_type_id, INTEGER5 set_size, STRING25 start_date, STRING25 end_date, INTEGER5 status_type_id, STRING3 delete_flag, STRING message, STRING200 description, INTEGER5 real_set_size, STRING500 obfusc_method}),,'~i2b2demodata::qt_query_result_instance_1432735973908',OVERWRITE);
SEQUENTIAL(Std.File.CreateSuperFile('~i2b2demodata::qt_query_result_instance'),
Std.File.StartSuperFileTransaction(),
Std.File.AddSuperFile('~i2b2demodata::qt_query_result_instance','~i2b2demodata::qt_query_result_instance_1432735973908'),
Std.File.FinishSuperFileTransaction());
OUTPUT(DATASET([],{INTEGER5 query_master_id, STRING250 name, STRING50 user_id, STRING50 group_id, STRING2000 master_type_cd, INTEGER5 plugin_id, STRING25 create_date, STRING25 delete_date, STRING3 delete_flag, STRING request_xml, STRING generated_sql, STRING i2b2_request_xml, STRING pm_xml}),,'~i2b2demodata::qt_query_master_1432735966025',OVERWRITE);
SEQUENTIAL(Std.File.CreateSuperFile('~i2b2demodata::qt_query_master'),
Std.File.StartSuperFileTransaction(),
Std.File.AddSuperFile('~i2b2demodata::qt_query_master','~i2b2demodata::qt_query_master_1432735966025'),
Std.File.FinishSuperFileTransaction());
OUTPUT(DATASET([],{INTEGER5 query_instance_id, INTEGER5 query_master_id, STRING50 user_id, STRING50 group_id, STRING50 batch_mode, STRING25 start_date, STRING25 end_date, STRING3 delete_flag, INTEGER5 status_type_id, STRING message}),,'~i2b2demodata::qt_query_instance_1432735960001',OVERWRITE);
SEQUENTIAL(Std.File.CreateSuperFile('~i2b2demodata::qt_query_instance'),
Std.File.StartSuperFileTransaction(),
Std.File.AddSuperFile('~i2b2demodata::qt_query_instance','~i2b2demodata::qt_query_instance_1432735960001'),
Std.File.FinishSuperFileTransaction());
OUTPUT(DATASET([],{INTEGER5 query_master_id, STRING50 user_id, STRING50 group_id, STRING25 create_date, STRING request_xml, STRING i2b2_request_xml}),,'~i2b2demodata::qt_pdo_query_master_1432735951288',OVERWRITE);
SEQUENTIAL(Std.File.CreateSuperFile('~i2b2demodata::qt_pdo_query_master'),
Std.File.StartSuperFileTransaction(),
Std.File.AddSuperFile('~i2b2demodata::qt_pdo_query_master','~i2b2demodata::qt_pdo_query_master_1432735951288'),
Std.File.FinishSuperFileTransaction());
OUTPUT(DATASET([],{INTEGER8 patient_set_coll_id, INTEGER5 result_instance_id, INTEGER5 set_index, INTEGER5 patient_num}),,'~i2b2demodata::qt_patient_set_collection_1432735945409',OVERWRITE);
SEQUENTIAL(Std.File.CreateSuperFile('~i2b2demodata::qt_patient_set_collection'),
Std.File.StartSuperFileTransaction(),
Std.File.AddSuperFile('~i2b2demodata::qt_patient_set_collection','~i2b2demodata::qt_patient_set_collection_1432735945409'),
Std.File.FinishSuperFileTransaction());
OUTPUT(DATASET([],{INTEGER5 patient_enc_coll_id, INTEGER5 result_instance_id, INTEGER5 set_index, INTEGER5 patient_num, INTEGER5 encounter_num}),,'~i2b2demodata::qt_patient_enc_collection_1432735939032',OVERWRITE);
SEQUENTIAL(Std.File.CreateSuperFile('~i2b2demodata::qt_patient_enc_collection'),
Std.File.StartSuperFileTransaction(),
Std.File.AddSuperFile('~i2b2demodata::qt_patient_enc_collection','~i2b2demodata::qt_patient_enc_collection_1432735939032'),
Std.File.FinishSuperFileTransaction());
OUTPUT(DATASET([],{INTEGER5 plugin_id, INTEGER5 result_type_id}),,'~i2b2demodata::qt_analysis_plugin_result_type_1432735931344',OVERWRITE);
SEQUENTIAL(Std.File.CreateSuperFile('~i2b2demodata::qt_analysis_plugin_result_type'),
Std.File.StartSuperFileTransaction(),
Std.File.AddSuperFile('~i2b2demodata::qt_analysis_plugin_result_type','~i2b2demodata::qt_analysis_plugin_result_type_1432735931344'),
Std.File.FinishSuperFileTransaction());
OUTPUT(DATASET([],{INTEGER5 plugin_id, STRING2000 plugin_name, STRING2000 description, STRING50 version_cd, STRING parameter_info, STRING parameter_info_xsd, STRING command_line, STRING working_folder, STRING commandoption_cd, STRING plugin_icon, STRING50 status_cd, STRING50 user_id, STRING50 group_id, STRING25 create_date, STRING25 update_date}),,'~i2b2demodata::qt_analysis_plugin_1432735907307',OVERWRITE);
SEQUENTIAL(Std.File.CreateSuperFile('~i2b2demodata::qt_analysis_plugin'),
Std.File.StartSuperFileTransaction(),
Std.File.AddSuperFile('~i2b2demodata::qt_analysis_plugin','~i2b2demodata::qt_analysis_plugin_1432735907307'),
Std.File.FinishSuperFileTransaction());
OUTPUT(DATASET([],{INTEGER5 total_patient, INTEGER5 total_observationfact, INTEGER5 total_event, STRING25 report_date}),,'~i2b2demodata::datamart_report_1432735839864',OVERWRITE);
SEQUENTIAL(Std.File.CreateSuperFile('~i2b2demodata::datamart_report'),
Std.File.StartSuperFileTransaction(),
Std.File.AddSuperFile('~i2b2demodata::datamart_report','~i2b2demodata::datamart_report_1432735839864'),
Std.File.FinishSuperFileTransaction());
OUTPUT(DATASET([],{STRING100 table_cd, STRING100 column_cd, STRING50 code_cd, STRING650 name_char, STRING lookup_blob, STRING25 upload_date, STRING25 update_date, STRING25 download_date, STRING25 import_date, STRING50 sourcesystem_cd, INTEGER5 upload_id}),,'~i2b2demodata::code_lookup_1432735800506',OVERWRITE);
SEQUENTIAL(Std.File.CreateSuperFile('~i2b2demodata::code_lookup'),
Std.File.StartSuperFileTransaction(),
Std.File.AddSuperFile('~i2b2demodata::code_lookup','~i2b2demodata::code_lookup_1432735800506'),
Std.File.FinishSuperFileTransaction());