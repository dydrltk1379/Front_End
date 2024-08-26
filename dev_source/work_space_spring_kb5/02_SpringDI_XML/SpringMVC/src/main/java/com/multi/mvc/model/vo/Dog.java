package com.multi.mvc.multi.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Dog implements Pet {
	private String name;
	private int age;

	@Override
	public String speak() {
		return "웍!웍!";
	}
}
