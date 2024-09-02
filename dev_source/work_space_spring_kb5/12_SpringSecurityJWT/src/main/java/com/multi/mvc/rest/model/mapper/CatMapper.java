package com.multi.mvc.rest.model.mapper;


import com.multi.mvc.rest.model.vo.Cat;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CatMapper {
	List<Cat> selectAll();
	List<Cat> selectByName(String name);
	Cat selectById(int id);
	int insertCat(Cat cat);
	Cat selectMostRecent();
	int updateCat(Cat requestCat);
	int deleteCat(int id);
}
