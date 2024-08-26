package com.multi.rest.content.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.multi.rest.content.model.vo.Cat;
import com.multi.rest.content.service.CatService;

@RequestMapping("/catWeb")
@RestController
public class CatRestForWebController {

	@Autowired
	CatService service;

	@GetMapping("")
	ResponseEntity<Map<String, Object>> getCatInfo(@RequestParam(name = "name", required = false) String name) {
		List<Cat> list = null;

		if (name == null) {
			list = service.selectAll();
		} else {
			list = service.selectByName(name);
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return ResponseEntity.status(HttpStatus.OK).body(map);
	}

	@GetMapping("/{id}")
	ResponseEntity<Map<String, Object>> getCatInfo(@PathVariable("id") int id) {
		Cat cat = service.selectById(id);
		Map<String, Object> map = new HashMap<String, Object>();
		if (cat != null) {
			map.put("result", "ok");
			map.put("cat", cat);
			return ResponseEntity.status(HttpStatus.OK).body(map);
		} else {
			map.put("result", "error");
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(map);
		}
	}
}
