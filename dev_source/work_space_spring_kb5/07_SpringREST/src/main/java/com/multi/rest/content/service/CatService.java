package com.multi.rest.content.service;

import com.multi.rest.content.model.mapper.CatMapper;
import com.multi.rest.content.model.vo.Cat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CatService {

	@Autowired
	private CatMapper mapper;
	
	public List<Cat> selectAll(){
		return mapper.selectAll();
	}

	public List<Cat> selectByName(String name) {
		return mapper.selectByName(name);
	}

	public Cat selectById(int id) {
		return mapper.selectById(id);
	}

	public int insertCat(Cat cat) {
		return mapper.insertCat(cat);
	}
	
	public Cat selectMostRecent() {
		return mapper.selectMostRecent();
	}

	public Cat updateCat(Cat requestCat) {
		int result = mapper.updateCat(requestCat);
		if(result > 0) {
			return mapper.selectById(requestCat.getId());
		}else {
			return null;
		}
	}

	public int deleteCat(int id) {
		return mapper.deleteCat(id);
	}
}
