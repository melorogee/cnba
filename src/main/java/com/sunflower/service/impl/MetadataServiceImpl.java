package com.sunflower.service.impl;

import com.sunflower.dao.MetadataDao;
import com.sunflower.service.MetadataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class MetadataServiceImpl implements MetadataService {
	@Autowired
	private MetadataDao metadataDao;


	public List<Map<String, Object>> initCompanyContent(String id) {
		List<Map<String, Object>> datalist = metadataDao.initCompanyContent(id);
		return datalist;
	}

	public List<Map<String, Object>> companyFiles() {
		List<Map<String, Object>> datalist = metadataDao.companyFiles();
		return datalist;
	}
	public List<Map<String, Object>> companyCulture() {
		List<Map<String, Object>> datalist = metadataDao.companyCulture();
		return datalist;
	}


	public List<Map<String, Object>> gettraining() {
		List<Map<String, Object>> datalist = metadataDao.gettraining();
		return datalist;
	}

	public List<Map<String, Object>> get_scba() {
		List<Map<String, Object>> datalist = metadataDao.get_scba();
		return datalist;
	}
	public List<Map<String, Object>> brandBuild() {
		List<Map<String, Object>> datalist = metadataDao.brandBuild();
		return datalist;
	}
	public List<Map<String, Object>> companyIntroduction() {
		List<Map<String, Object>> datalist = metadataDao.companyIntroduction();
		return datalist;
	}

	public void save_companyIntroduction(String content) {
		metadataDao.save_companyIntroduction(content);
	}

	public void save_companyCulture(String content) {
		metadataDao.save_companyCulture(content);
	}

	public void save_companyFiles(String content) {
		metadataDao.save_companyFiles(content);
	}


	public void save_brandBuild(String content) {
		metadataDao.save_brandBuild(content);
	}

	public void save_trainning(String content) {
		metadataDao.save_trainning(content);
	}

	public void save_aboutus(String content) {
		metadataDao.save_aboutus(content);
	}

	public void save_sqba(String content) {
		metadataDao.save_sqba(content);
	}

	public void save_scba(String content) {
		metadataDao.save_scba(content);
	}

	public List<Map<String, Object>> initFriendLinks() {
		List<Map<String, Object>> datalist = metadataDao.initFriendLinks();
		return datalist;
	}
	public List<Map<String, Object>> initCompanyNewsList() {
		List<Map<String, Object>> datalist = metadataDao.initCompanyNewsList();
		return datalist;
	}
	public List<Map<String, Object>> initBanner() {
		List<Map<String, Object>> datalist = metadataDao.initBanner();
		return datalist;
	}
	public List<Map<String, Object>> get_aboutus() {
		List<Map<String, Object>> datalist = metadataDao.get_aboutus();
		return datalist;
	}
	public List<Map<String, Object>> get_sqba() {
		List<Map<String, Object>> datalist = metadataDao.get_sqba();
		return datalist;
	}

	public List<Map<String, Object>> initList(Map<String,Object> paramMap) {
		List<Map<String, Object>> datalist = metadataDao.initList(paramMap);
		return datalist;
	}

	public Map<String, Object> initDetailInfo(Map<String, Object> paramMap) {
		Map<String, Object> dataObj = metadataDao.initDetailInfo(paramMap);
		return dataObj;
	}

	public Map<String, Object> initCodeInfo(Map<String, Object> paramMap) {
		Map<String, Object> dataObj = metadataDao.initCodeInfo(paramMap);
		return dataObj;
	}

	public Map<String, Object> initTableRelation(Map<String, Object> paramMap) {
		Map<String, Object> dataObj = metadataDao.initTableRelation(paramMap);
		return dataObj;
	}

	public Integer totalCount(Map<String, Object> paramMap) {
		Integer totalCount = metadataDao.totalCount(paramMap);
		return totalCount;
	}

	public Integer student_count() {
		Integer totalCount = metadataDao.student_count();
		return totalCount;
	}

	public Integer student_class_count() {
		Integer student_class_count = metadataDao.student_class_count();
		return student_class_count;
	}

	public Integer term_week() {
		Integer term_week = metadataDao.term_week();
		return term_week;
	}

	public Integer class_count() {
		Integer class_count = metadataDao.class_count();
		return class_count;
	}

	public Integer pre_student_count() {
		Integer pre_student_count = metadataDao.pre_student_count();
		return pre_student_count;
	}

	public List<String> birthday_student(String dateNowStr) {
		List<String> birthday_student = metadataDao.birthday_student(dateNowStr);
		return birthday_student;
	}



	public void delete_new(String id) {
		metadataDao.delete_new(id);
	}

	public void save_new(String title,String content,String time,String id) {
		metadataDao.save_new(title,content,time,id);
	}

}
