#!/usr/bin/js

master_table = {
	name: 'observation_fact',
	schema: 'i2b2demodata',
	fullname: function() {
		return this.schema + '.' + this.name;
	},
	columnsToCopy: 'ENCOUNTER_NUM, PATIENT_NUM, CONCEPT_CD, PROVIDER_ID, START_DATE, MODIFIER_CD, INSTANCE_NUM, VALTYPE_CD, TVAL_CHAR, NVAL_NUM, VALUEFLAG_CD, QUANTITY_NUM, UNITS_CD, END_DATE, LOCATION_CD, OBSERVATION_BLOB, CONFIDENCE_NUM, UPDATE_DATE, DOWNLOAD_DATE, IMPORT_DATE, SOURCESYSTEM_CD, UPLOAD_ID',
	dataLocation: "'/home/ubuntu/Datensatz/datamart/observation_fact.csv'",
	copyCommand: function() {
		return 'COPY ' +  this.fullname() + '(' + this.columnsToCopy + ') FROM ' + this.dataLocation + " DELIMITER '|' CSV;"
	},
	indices: [
	{
		name: 'OF_IDX_ClusteredConcept',
		columns: 'CONCEPT_CD'
	},
	{
		name: 'OF_IDX_ALLObservation_Fact',
		columns: 'PATIENT_NUM, ENCOUNTER_NUM, CONCEPT_CD, START_DATE, PROVIDER_ID, MODIFIER_CD, INSTANCE_NUM, VALTYPE_CD, TVAL_CHAR, NVAL_NUM, VALUEFLAG_CD, QUANTITY_NUM, UNITS_CD, END_DATE, LOCATION_CD, CONFIDENCE_NUM'
	},
	{
		name: 'OF_IDX_Start_Date',
		columns: 'START_DATE, PATIENT_NUM'
	},
	{
		name: 'OF_IDX_Modifier',
		columns: 'MODIFIER_CD'
	},
	{
		name: 'OF_IDX_Encounter_Patient',
		columns: 'ENCOUNTER_NUM, PATIENT_NUM, INSTANCE_NUM'
	},
	{
		name: 'OF_IDX_UPLOADID',
		columns: 'UPLOAD_ID'
	},
	{
		name: 'OF_IDX_SOURCESYSTEM_CD',
		columns: 'SOURCESYSTEM_CD'
	},
	{
		name: 'OF_TEXT_SEARCH_UNIQUE',
		columns: 'TEXT_SEARCH_INDEX'
	}],
	primaryKey: {
		name: 'observation_fact_pk',
		columns: 'PATIENT_NUM, CONCEPT_CD, MODIFIER_CD, START_DATE, ENCOUNTER_NUM, INSTANCE_NUM, PROVIDER_ID'
	}
}

function Partition(name, constraint) {
	this.name = name;
	this._constraint = constraint;
}

Partition.prototype.constraint = function(replacor) {
	replacor = replacor || '';
	return this._constraint.replace(/\$/g, replacor);
}

partitions = [
	new Partition('a', "$concept_cd LIKE 'ICD:A%'"),
	new Partition('b', "$concept_cd LIKE 'ICD:B%'"),
	new Partition('c', "$concept_cd LIKE 'ICD:C%'"),
	new Partition('d', "$concept_cd LIKE 'ICD:D%'"),
	new Partition('e', "$concept_cd LIKE 'ICD:E%'"),
	new Partition('f', "$concept_cd LIKE 'ICD:F%'"),
	new Partition('g', "$concept_cd LIKE 'ICD:G%'"),
	new Partition('h', "$concept_cd LIKE 'ICD:H%'"),
	new Partition('i', "$concept_cd LIKE 'ICD:I%'"),
	new Partition('j', "$concept_cd LIKE 'ICD:J%'"),
	new Partition('k', "$concept_cd LIKE 'ICD:K%'"),
	new Partition('l', "$concept_cd LIKE 'ICD:L%'"),
	new Partition('m', "$concept_cd LIKE 'ICD:M%'"),
	new Partition('n', "$concept_cd LIKE 'ICD:N%'"),
	new Partition('o', "$concept_cd LIKE 'ICD:O%'"),
	new Partition('p', "$concept_cd LIKE 'ICD:P%'"),
	new Partition('q', "$concept_cd LIKE 'ICD:Q%'"),
	new Partition('r', "$concept_cd LIKE 'ICD:R%'"),
	new Partition('s', "$concept_cd LIKE 'ICD:S%'"),
	new Partition('t', "$concept_cd LIKE 'ICD:T%'"),
	new Partition('u', "$concept_cd LIKE 'ICD:U%'"),
	new Partition('v', "$concept_cd LIKE 'ICD:V%'"),
	new Partition('w', "$concept_cd LIKE 'ICD:W%'"),
	new Partition('x', "$concept_cd LIKE 'ICD:X%'"),
	new Partition('y', "$concept_cd LIKE 'ICD:Y%'"),
	new Partition('z', "$concept_cd LIKE 'ICD:Z%'"),
	new Partition('other', "$concept_cd NOT LIKE 'ICD:A%' AND $concept_cd NOT LIKE 'ICD:B%' AND $concept_cd NOT LIKE 'ICD:C%' AND $concept_cd NOT LIKE 'ICD:D%' AND $concept_cd NOT LIKE 'ICD:E%' AND $concept_cd NOT LIKE 'ICD:F%' AND $concept_cd NOT LIKE 'ICD:G%' AND $concept_cd NOT LIKE 'ICD:H%' AND $concept_cd NOT LIKE 'ICD:I%' AND $concept_cd NOT LIKE 'ICD:J%' AND $concept_cd NOT LIKE 'ICD:K%' AND $concept_cd NOT LIKE 'ICD:L%' AND $concept_cd NOT LIKE 'ICD:M%' AND $concept_cd NOT LIKE 'ICD:N%' AND $concept_cd NOT LIKE 'ICD:O%' AND $concept_cd NOT LIKE 'ICD:P%' AND $concept_cd NOT LIKE 'ICD:Q%' AND $concept_cd NOT LIKE 'ICD:R%' AND $concept_cd NOT LIKE 'ICD:S%' AND $concept_cd NOT LIKE 'ICD:T%' AND $concept_cd NOT LIKE 'ICD:U%' AND $concept_cd NOT LIKE 'ICD:V%' AND $concept_cd NOT LIKE 'ICD:W%' AND $concept_cd NOT LIKE 'ICD:X%' AND $concept_cd NOT LIKE 'ICD:Y%' AND $concept_cd NOT LIKE 'ICD:Z%'")
]

console.log('ALTER TABLE %s DROP CONSTRAINT %s;', master_table.fullname(), master_table.primaryKey.name);
master_table.indices.forEach(function(index) {
	console.log('DROP INDEX %s.%s;', master_table.schema, index.name);
})

console.log('TRUNCATE %s;', master_table.fullname());

console.log('\n');

partitions.forEach(function(partition) {
	console.log('CREATE TABLE %s_%s (', master_table.fullname(), partition.name);
	console.log('\tCHECK (%s)', partition.constraint());
	console.log(') INHERITS (%s);', master_table.fullname());
})

console.log('\n');

console.log('CREATE OR REPLACE FUNCTION %s_insert_trigger()', master_table.name);
console.log('RETURNS TRIGGER AS $$');
console.log('BEGIN');

partitions.forEach(function(partition, index) {
	console.log('\t%s (%s) THEN', index? 'ELSIF' : 'IF', partition.constraint('NEW.'));
	console.log('\t\tINSERT INTO %s_%s VALUES (NEW.*);', master_table.fullname(), partition.name);
})

console.log('\tELSE');
console.log("\t\tRAISE EXCEPTION 'Value out of range.  Fix the %s_insert_trigger() function!';", master_table.name);
console.log('\tEND IF;');
console.log('\tRETURN NULL;');
console.log('END;');
console.log('$$');
console.log('LANGUAGE plpgsql;');

console.log('\n');

console.log('CREATE TRIGGER insert_%s_trigger', master_table.name);
console.log('\tBEFORE INSERT ON %s', master_table.fullname());
console.log('\tFOR EACH ROW EXECUTE PROCEDURE %s_insert_trigger();', master_table.name);

console.log('\n');

console.log('SET constraint_exclusion = on;');

console.log('\n');

console.log(master_table.copyCommand());

console.log('\n');

partitions.forEach(function(partition) {
	console.log('ALTER TABLE %s_%s ADD CONSTRAINT %s_%s PRIMARY KEY(%s);', master_table.fullname(), partition.name, master_table.primaryKey.name, partition.name, master_table.primaryKey.columns);
	master_table.indices.forEach(function(index) {
		console.log('CREATE INDEX %s_%s ON %s_%s(%s);', index.name, partition.name, master_table.fullname(), partition.name, index.columns);
	})
	console.log('\n');
})