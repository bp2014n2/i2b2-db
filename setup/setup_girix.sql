DELETE FROM i2b2pm.pm_cell_data WHERE cell_id LIKE 'GIRIX';
INSERT INTO i2b2pm.pm_cell_data(cell_id, project_path, name, method_cd, url, can_override, change_date, entry_date, changeby_char, status_cd) VALUES ('GIRIX','/','GIRIX Cell','REST','http://localhost:9090/i2b2/services/GIRIXService/',1,null,null,null,'A');
