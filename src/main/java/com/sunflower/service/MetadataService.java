package com.sunflower.service;

import java.util.List;
import java.util.Map;

public interface MetadataService {
	List<Map<String,Object>> initList(Map<String,Object> paramMap);

	Map<String,Object> initDetailInfo(Map<String,Object> paramMap);

	Map<String,Object> initCodeInfo(Map<String,Object> paramMap);

	Map<String,Object> initTableRelation(Map<String,Object> paramMap);

	Integer totalCount(Map<String,Object> paramMap);

	Integer student_count();
	Integer student_class_count();
	Integer term_week();
	Integer class_count();
	Integer pre_student_count();
	List<String> birthday_student(String dateNowStr);
}
