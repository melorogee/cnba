package com.sunflower.dao;

import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface MetadataDao{
	List<Map<String,Object>> get_aboutus();
	List<Map<String,Object>> initBanner();
	List<Map<String,Object>> initCompanyNewsList();
	List<Map<String,Object>> initFriendLinks();
	List<Map<String,Object>> companyIntroduction();
	List<Map<String,Object>> brandBuild();
	List<Map<String,Object>> get_scba();
	List<Map<String,Object>> get_sqba();
	List<Map<String,Object>> gettraining();
	List<Map<String,Object>> companyCulture();
	List<Map<String,Object>> companyFiles();
	List<Map<String,Object>> initCompanyContent(String id);



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

	void save_companyIntroduction(String content);

	void save_companyCulture(String content);

	void save_companyFiles(String content);

	void save_brandBuild(String content);

	void save_trainning(String content);

	void save_aboutus(String content);

	void save_sqba(String content);

	void save_scba(String content);

	void delete_new(String id);

	void save_new(String title,String content,String time,String id);
}