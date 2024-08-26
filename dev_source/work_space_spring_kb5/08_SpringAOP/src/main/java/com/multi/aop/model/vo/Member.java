package com.multi.aop.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int mno;
	private String id;
	private String pw;
	private String name;
	private int age;
	private String address;
}
